class KsysrootX8664Freebsd134AT134FreebsdStable < Formula
  desc "Sysroot for x86_64-freebsd13.4@FreeBSD13.4-STABLE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "BSD-2-Clause"
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
    url "https://download.freebsd.org/snapshots/amd64/amd64/13.4-STABLE/base.txz"
    version "13.4-STABLE-ksr"
    sha256 "f11df0f6279d0b525ada6f8477bafc87d536859ef78bffc12174322db525f04f"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-freebsd13.4 KSYSROOT_FULL_TRIPLE=x86_64-freebsd13.4
      # KSYSROOT_OSFLAVOUR=FreeBSD KSYSROOT_OSRELEASE=13.4-STABLE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # FREEBSD_VERSION=13.4-STABLE FREEBSD_KERNEL=13.4 FREEBSD_MACHINE=amd64 FREEBSD_MACHINE_ARCH=amd64
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
    meson_cross.install prefix/"cross.txt" => "x86_64-freebsd13.4"
    meson_cross.install_symlink meson_cross/"x86_64-freebsd13.4" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664Freebsd134AT134FreebsdStable.stable.url
      sha256 KsysrootX8664Freebsd134AT134FreebsdStable.stable.checksum.hexdigest
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
             "--cross-file=x86_64-freebsd13.4", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/x86_64-freebsd13.4-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/x86_64-freebsd13.4-pkg-config --cflags libcrypto").strip
    end
  end
end
