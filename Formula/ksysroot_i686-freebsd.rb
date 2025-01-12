class KsysrootI686Freebsd < Formula
  desc "Sysroot for i686-freebsd14.2@FreeBSD14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ae8b40da74b6b7afcb1f43948ef2a7aafbad67609ac0d1c0ca30762e963a8bc"
    sha256 cellar: :any_skip_relocation, ventura:       "f6c3e647025903ce5db2f7fa8486d6a1c2c2acf077f1856bcb2b6bbd3c4110fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a001cfc38eb3d918f043f8deb5c78390f82660413b99cb66b617bb061c7d1da0"
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

  resource "base.txz" do
    url "https://download.freebsd.org/releases/i386/i386/14.2-RELEASE/base.txz"
    version "14.2-RELEASE-ksr"
    sha256 "2b8043a6d0b8c53c16e205db540744170eccd91a7475d3c3ac43f62041317c0f"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=i686-freebsd14.2 KSYSROOT_FULL_TRIPLE=i686-freebsd14.2
      # KSYSROOT_OSFLAVOUR=FreeBSD KSYSROOT_OSRELEASE=14.2-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=x86 MESON_CPU=x86 MESON_ENDIAN=little
      # FREEBSD_VERSION=14.2-RELEASE FREEBSD_KERNEL=14.2 FREEBSD_MACHINE=i386 FREEBSD_MACHINE_ARCH=i386
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="i686-freebsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "i686-freebsd14.2"
    meson_cross.install_symlink meson_cross/"i686-freebsd14.2" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootI686Freebsd.stable.url
      sha256 KsysrootI686Freebsd.stable.checksum.hexdigest
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
             "--cross-file=i686-freebsd14.2", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/i686-freebsd14.2-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/i686-freebsd14.2-pkg-config --cflags libcrypto").strip
    end
  end
end
