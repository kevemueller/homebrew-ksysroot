class KsysrootMips64elLinux612Gnuabi64AT13Debian < Formula
  desc "Sysroot for mips64el-linux-gnuabi64@Debian13"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "e168ab72d24d29dddce668fcf6c9ebaf2f4062a8e83449fccc8a66640b2b5acb"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "ba70167f296c855f5f95a06e891b6c3a91af670998f72c6996e5962242591337"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-5_mips64el.deb"
    version "2.40-5-ksr"
    sha256 "30b4d5bf160e4dfcceeee1fb601b570f14873badcae1f38c6a50791c1e12e380"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-5_mips64el.deb"
    version "2.40-5-ksr"
    sha256 "87477d9a8a5cc09d425300d0fe7de3f37e8c48c0353fd488263a5fc79e76f1c2"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-5_mips64el.deb"
    version "2.40-5-ksr"
    sha256 "08b1e31685e2ce3ad71ac272f95b2c6ba67ca249dbdec07014ac8f50cdd2e44a"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_mips64el.deb"
    version "1:4.4.36-5-ksr"
    sha256 "e484d09b17e4d65d31a4e94313e59c893d0a9ee3de063f14d7ff393c451044c7"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_mips64el.deb"
    version "1:4.4.36-5-ksr"
    sha256 "196063e701d6497e43b990f2dde93b008b2247a4cb47e16b45ec87a1ff56624d"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "23ad2286c1b00cec9654d0cc58cf06af16c0bd4f98e3df8b7cc7d340441b72fe"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "3f4d66731e43113c0e3eb56ba61d6f356c60028d103d96325c2ba488de90788d"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "6bc353122f7ff622955998fe12f27f46cf2fd5aedfc58b37f2d73228db7f5a5d"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "97c9f3912a4c73b558cfab903b1b592676cea6e7a49943a5b09218b3e3a01049"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-12_mips64el.deb"
    version "14.2.0-12-ksr"
    sha256 "f7f4575b4ddfc811ae8f912e1f9a35292b4c38425ca23242658def8df586259c"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_mips64el.deb"
    version "1.4.3-1-ksr"
    sha256 "1b34e89ec12a59b795d53352b94d73223aba96f77f1307e77c1531469ba3f0bc"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=mips64el-linux-gnuabi64 KSYSROOT_FULL_TRIPLE=mips64el-linux6.12-gnuabi64
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=mips64 MESON_CPU=mips64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=mips64el LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "mips64el-linux6.12-gnuabi64"
    meson_cross.install_symlink meson_cross/"mips64el-linux6.12-gnuabi64" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootMips64elLinux612Gnuabi64AT13Debian.stable.url
      sha256 KsysrootMips64elLinux612Gnuabi64AT13Debian.stable.checksum.hexdigest
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
             "--cross-file=mips64el-linux6.12-gnuabi64", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/mips64el-linux6.12-gnuabi64-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/mips64el-linux6.12-gnuabi64-pkg-config --cflags libcrypt").strip
    end
  end
end
