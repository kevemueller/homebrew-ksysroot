class KsysrootX8664Dragonflybsd < Formula
  desc "Sysroot for x86_64-dragonflybsd6.4@DragonFlyBSD6.4"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "BSD-3-Clause"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a67f1a1a5bcbbd1c7501cdfc86d1df48c0413fb2e9882c351dbf32054eb31ae5"
    sha256                               ventura:       "da5acd101e2abcb06dd8dac2d7003c54d536d239b0bf525b3a79804aba45dfea"
  end

  depends_on "meson" => :test
  depends_on "ksysroot_native"
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"
  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "dfly-x86_64-6.4.0_REL.iso.bz2" do
    url "https://avalon.dragonflybsd.org/iso-images/dfly-x86_64-6.4.0_REL.iso.bz2"
    version "6.4-ksr"
    sha256 "c213cc20ba1284efafe017c16db1974c154728e2e757c649af91d0e2a246a0dd"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-dragonflybsd6.4 KSYSROOT_FULL_TRIPLE=x86_64-dragonflybsd6.4
      # KSYSROOT_OSFLAVOUR=DragonFlyBSD KSYSROOT_OSRELEASE=6.4
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-3-Clause
      # MESON_SYSTEM=dragonfly MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # DFLYBSD_VERSION=6.4 DFLYBSD_KERNEL=6.4
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="x86_64-dragonflybsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "x86_64-dragonflybsd6.4"
    meson_cross.install_symlink meson_cross/"x86_64-dragonflybsd6.4" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664Dragonflybsd.stable.url
      sha256 KsysrootX8664Dragonflybsd.stable.checksum.hexdigest
    end
    resource("testcases").stage do
      ENV.delete("CC")
      ENV.delete("CXX")
      ENV.delete("CXX")
      ENV.delete("OBJC")
      ENV.delete("OBJCXX")
      ENV.delete("CFLAGS")
      ENV.delete("CPPFLAGS")
      ENV.delete("CXXFLAGS")
      ENV.delete("LDFLAGS")
      ENV.delete("LD_RUN_PATH")
      ENV.delete("LIBRARY_PATH")
      ENV.delete("OBJCFLAGS")
      ENV.delete("OBJCXXFLAGS")
      ENV.delete("CPATH")
      ENV.delete("PKG_CONFIG_LIBDIR")
      system "set"
      # build a C and C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             "--cross-file=x86_64-dragonflybsd6.4", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/x86_64-dragonflybsd6.4-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/x86_64-dragonflybsd6.4-pkg-config --cflags libcrypto").strip
    end
  end
end
