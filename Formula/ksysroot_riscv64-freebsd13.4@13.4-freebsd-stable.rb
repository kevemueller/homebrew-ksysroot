class KsysrootRiscv64Freebsd134AT134FreebsdStable < Formula
  desc "Sysroot for riscv64-freebsd13.4@FreeBSD13.4-STABLE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "BSD-2-Clause"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

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
    url "https://download.freebsd.org/snapshots/riscv/riscv64/13.4-STABLE/base.txz"
    version "13.4-STABLE-ksr"
    sha256 "325420a476ba8d265e9bf816656fa7c55c497141f8a88158c5d25457342c1a49"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=riscv64-freebsd13.4 KSYSROOT_FULL_TRIPLE=riscv64-freebsd13.4
      # KSYSROOT_OSFLAVOUR=FreeBSD KSYSROOT_OSRELEASE=13.4-STABLE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=riscv64 MESON_CPU=riscv64 MESON_ENDIAN=little
      # FREEBSD_VERSION=13.4-STABLE FREEBSD_KERNEL=13.4 FREEBSD_MACHINE=riscv FREEBSD_MACHINE_ARCH=riscv64
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple=""
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "riscv64-freebsd13.4"
    meson_cross.install_symlink meson_cross/"riscv64-freebsd13.4" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootRiscv64Freebsd134AT134FreebsdStable.stable.url
      sha256 KsysrootRiscv64Freebsd134AT134FreebsdStable.stable.checksum.hexdigest
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
             "--cross-file=riscv64-freebsd13.4", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/riscv64-freebsd13.4-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/riscv64-freebsd13.4-pkg-config --cflags libcrypto").strip
    end
  end
end
