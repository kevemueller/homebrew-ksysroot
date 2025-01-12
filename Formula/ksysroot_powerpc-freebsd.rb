class KsysrootPowerpcFreebsd < Formula
  desc "Sysroot for powerpc-freebsd14.2@FreeBSD14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05fcdf2791513dfaaf6df676268f2b094ce5438067f019c78acea686b46ac774"
    sha256 cellar: :any_skip_relocation, ventura:       "febf0604694766e892f6bafe8f121c0302130916c82f0558c35f1c8e90be8c41"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "65cda998298597d541b39b6f3b300b3eb5d2583d1932039702da83c482a16b72"
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
    url "https://download.freebsd.org/releases/powerpc/powerpc/14.2-RELEASE/base.txz"
    version "14.2-RELEASE-ksr"
    sha256 "16a791239a714e5a055fc5527e50fdbb5b9332349278221504ba8671387915d9"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc-freebsd14.2 KSYSROOT_FULL_TRIPLE=powerpc-freebsd14.2
      # KSYSROOT_OSFLAVOUR=FreeBSD KSYSROOT_OSRELEASE=14.2-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=ppc MESON_CPU=ppc MESON_ENDIAN=little
      # FREEBSD_VERSION=14.2-RELEASE FREEBSD_KERNEL=14.2 FREEBSD_MACHINE=powerpc FREEBSD_MACHINE_ARCH=powerpc
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="powerpc-freebsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "powerpc-freebsd14.2"
    meson_cross.install_symlink meson_cross/"powerpc-freebsd14.2" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootPowerpcFreebsd.stable.url
      sha256 KsysrootPowerpcFreebsd.stable.checksum.hexdigest
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
             "--cross-file=powerpc-freebsd14.2", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/powerpc-freebsd14.2-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/powerpc-freebsd14.2-pkg-config --cflags libcrypto").strip
    end
  end
end
