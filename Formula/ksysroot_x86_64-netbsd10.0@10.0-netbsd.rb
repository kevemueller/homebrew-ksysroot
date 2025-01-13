class KsysrootX8664Netbsd100AT100Netbsd < Formula
  desc "Sysroot for x86_64-netbsd10.0@NetBSD10.0"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "BSD-4-Clause-UC"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "base.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.0/amd64/binary/sets/base.tar.xz"
    version "10.0-ksr"
    sha256 "f68e070438bf72a74dc42e6ff3728859026b7122638c3b9bb455a88b744b5a49"
  end

  resource "comp.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.0/amd64/binary/sets/comp.tar.xz"
    version "10.0-ksr"
    sha256 "30513aa4944d3f1bbd7107a212b2c2c2d2ea678e349cc3dc1489a0a4359d006b"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-netbsd10.0 KSYSROOT_FULL_TRIPLE=x86_64-netbsd10.0
      # KSYSROOT_OSFLAVOUR=NetBSD KSYSROOT_OSRELEASE=10.0
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-4-Clause-UC
      # MESON_SYSTEM=netbsd MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # NETBSD_VERSION=10.0 NETBSD_KERNEL=10.0 NETBSD_PORT=amd64
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
    meson_cross.install prefix/"cross.txt" => "x86_64-netbsd10.0"
    meson_cross.install_symlink meson_cross/"x86_64-netbsd10.0" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664Netbsd100AT100Netbsd.stable.url
      sha256 KsysrootX8664Netbsd100AT100Netbsd.stable.checksum.hexdigest
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
             "--cross-file=x86_64-netbsd10.0", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
