class KsysrootRiscv64Freebsd150AT150FreebsdCurrent < Formula
  desc "Sysroot for riscv64-freebsd15.0@freebsd15.0-CURRENT"
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
    url "https://download.freebsd.org/snapshots/riscv/riscv64/15.0-CURRENT/base.txz"
    version "15.0-CURRENT"
    sha256 "9c884b386745d84ae4e26beaf9d1706f90958dd792f8ffbe69f6f1427cff7216"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=riscv64-freebsd15.0 KSYSROOT_FULL_TRIPLE=riscv64-freebsd15.0
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=15.0-CURRENT
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=riscv64 MESON_CPU=riscv64 MESON_ENDIAN=little
      # FREEBSD_VERSION=15.0-CURRENT FREEBSD_MACHINE=riscv FREEBSD_MACHINE_ARCH=riscv64
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
      assert_equal "-lcrypto", shell_output("#{bin}/riscv64-freebsd15.0-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/riscv64-freebsd15.0-pkg-config --cflags libcrypto").strip
    end
  end
end