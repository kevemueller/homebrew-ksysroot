class KsysrootI386Linux612GnuAT13Debian < Formula
  desc "Sysroot for i386-linux-gnu@Debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "GPL-2.0-or-later"
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

  resource "gcc-14-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "fc006225d860a191afc0c16bcc8cf48724267189b11a2779a4aeb0b6e26ef999"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "5eb91cc251fe298d0eb33404da8c91c917d92d3accb660a959856fc6e4325835"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "21b187f4c75237865f03baaa7473b9a71071deeebd6b739814b3ec472126d53c"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-5_i386.deb"
    version "2.40-5-ksr"
    sha256 "766d5ce1fe122d127f7c2369cdc6e914a8e7c4d0173cf88897c687a4e475f76b"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-5_i386.deb"
    version "2.40-5-ksr"
    sha256 "9d55ee12c2f7059769915caba3617dc688a7e716941c2bdad33dc2490baf5502"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-5_i386.deb"
    version "2.40-5-ksr"
    sha256 "5a818db56bf5433d1b8d0ef44eed57f0b5b0d8412b3a519266b420d7ae43f01e"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_i386.deb"
    version "1:4.4.36-5-ksr"
    sha256 "a9ec8c4324296ab828b2ae707cd2c0581da296b76e1244d3678f28e705930e7a"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_i386.deb"
    version "1:4.4.36-5-ksr"
    sha256 "1f9ad509260c89085a1a9b717df8ae4fb07bb486d4f8f9bd637aad82c407525d"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "8c5e8749272a7edcd3e9dbf935d283265a15654ddd8cee0d1d1e7ceb32411e9f"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "debf9e757cc34d15082180b7dedd345b894530e4d2aad0a5d1d825396a5f6f34"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "f45bc96a1171216f830bada5f3ad21c5975797cb4a301807a4834345147a328d"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "b1c495386d39b9893d2e6cee9ed1d99c5fed5840a9ebe018ee06de4b60bad167"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "6c47eba82807d13b8b29f2dffad27bf29929d87c24764800fb2938e5214634e0"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "0a017a3cd30dd1a262102f63dfd02346cf57574b6ef98a4086e3474c6a917faf"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "3deda120d56800d5280277a7b1bff2e9df13f19687519644bebb56f72406a65d"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-12_i386.deb"
    version "14.2.0-12-ksr"
    sha256 "d4e474e9816ee8aadaec2f02722d9c5b5cfd9c433f269cdf06bebc10a9c39338"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_i386.deb"
    version "1.4.3-1-ksr"
    sha256 "3900d246041e9cd5c7f69a08353c27c62360e9233e9e6032e6c732f767b9bf37"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=i386-linux-gnu KSYSROOT_FULL_TRIPLE=i386-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86 MESON_CPU=x86 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=i386 LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "i386-linux6.12-gnu"
    meson_cross.install_symlink meson_cross/"i386-linux6.12-gnu" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootI386Linux612GnuAT13Debian.stable.url
      sha256 KsysrootI386Linux612GnuAT13Debian.stable.checksum.hexdigest
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
             "--cross-file=i386-linux6.12-gnu", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/i386-linux6.12-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/i386-linux6.12-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
