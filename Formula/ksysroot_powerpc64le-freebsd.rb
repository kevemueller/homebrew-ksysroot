class KsysrootPowerpc64leFreebsd < Formula
  desc "Sysroot for powerpc64le-freebsd14.2@freebsd14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "65da7faaa17289fb4376f611df6f06f91abceaa1798562873094a4c426aacb2f"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3b365d9d18194479bd785bda6d52fb911772d90066910461115230a544dea6ab"
    sha256 cellar: :any_skip_relocation, ventura:       "4d5485c8450ceef63144b1151d2de8cb610aee743dc94b370771249ef819c011"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d40e3c1425e419edd3a3f7d950dc105de0ee7d09fc7244341552e5d26f32f7ee"
  end

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/powerpc/powerpc64le/14.2-RELEASE/base.txz"
    version "14.2-RELEASE"
    sha256 "2de95a1e5bc074af5073afa9b047622347fe51cd3886432b04a13fd9c26f7030"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-freebsd14.2 KSYSROOT_FULL_TRIPLE=powerpc64le-freebsd14.2
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=14.2-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=ppc64 MESON_CPU=ppc64 MESON_ENDIAN=little
      # FREEBSD_VERSION=14.2-RELEASE FREEBSD_MACHINE=powerpc FREEBSD_MACHINE_ARCH=powerpc64le
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version} #{r.url} #{r.cached_download.to_s.delete_prefix(cachedir)}"
    }.join("\n")
    bom << "\n"
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
  end

  test do
    resource "testcases" do
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.1.tar.gz"
      sha256 "65da7faaa17289fb4376f611df6f06f91abceaa1798562873094a4c426aacb2f"
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
      # cross build a C library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # cross build a C++ library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?

      # check pkg-config personality is proper
      assert_equal "-lcrypto", shell_output("#{bin}/powerpc64le-freebsd14.2-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/powerpc64le-freebsd14.2-pkg-config --cflags libcrypto").strip
    end
  end
end
