class KsysrootRiscv64Freebsd134AT134FreebsdRelease < Formula
  desc "Sysroot for riscv64-freebsd13.4@freebsd13.4-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "65da7faaa17289fb4376f611df6f06f91abceaa1798562873094a4c426aacb2f"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/riscv/riscv64/13.4-RELEASE/base.txz"
    version "13.4-RELEASE"
    sha256 "92f9399be65d3eb6579453e67bcb2df11bc74c637aae73fbdf08c2888ea15726"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=riscv64-freebsd13.4 KSYSROOT_FULL_TRIPLE=riscv64-freebsd13.4
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=13.4-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=riscv64 MESON_CPU=riscv64 MESON_ENDIAN=little
      # FREEBSD_VERSION=13.4-RELEASE FREEBSD_MACHINE=riscv FREEBSD_MACHINE_ARCH=riscv64
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
      assert_equal "-lcrypto", shell_output("#{bin}/riscv64-freebsd13.4-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/riscv64-freebsd13.4-pkg-config --cflags libcrypto").strip
    end
  end
end