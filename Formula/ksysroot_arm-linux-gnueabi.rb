class KsysrootArmLinuxGnueabi < Formula
  desc "Sysroot for arm-linux-gnueabi@Debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "GPL-2.0-or-later"
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

  resource "gcc-12-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "8ae6b47beee631e040d3877258644d11ac565727d3b0f9ee885e8126444cb561"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "1b089e630abc45bb7ea069a7c38e2935842b77b7390f12bb0b1b448c5a2f3d63"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "ddd5af2737c095beaea472bf87675b88cfc82012c8ba160b39b692e83538b213"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_armel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "233e63adf3dfa964888dacb1691ea4d0615d89fd1775ddc0c4d566e7914e5e1d"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_armel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "7a0047fce9a434c5380709bef49ddccc6c0aba4dea381ab824c22082f19c0658"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_armel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "4d3b09b270d031aa8a7d9c65e1490cabd298fc101c260fac397c0238256ae7f6"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_armel.deb"
    version "1.47.0-2-ksr"
    sha256 "fe2fae934a7f2dc6abdc899063db6547bf56100a1824eb356e565deaac9cdc1c"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_armel.deb"
    version "1:4.4.33-2-ksr"
    sha256 "1af76e8ec9a6859f4b2ea5f86244b24904d4f846c4aca96d4226662387bfdedb"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_armel.deb"
    version "1:4.4.33-2-ksr"
    sha256 "a56d0fac6237f76b8f42695baea45bc8a70ba152fe2566b29cf43b7dd4aa8e03"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "e169127c2f07be477b4ac498c3dd8a728836ddc69ae31ff1ee359485238d05ce"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "756d6759cbb82176f74f999bcebf59aef4daf990f9039eb65720e58b60f7f0d5"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "1ae903b0d1ae8ee26bd361094f9bec2d4c9c8ea7489ccafab34244ff281c9ed8"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_armel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "47647c744f893c63f2f7d2b91e3e1a53656ca4d24ba71e10660b92aa2d9d78ff"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_armel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "cf4753a4fc5b3796b89d0a953a28605540974fa0ae3a045ecd63d28f84a2b6b5"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_armel.deb"
    version "1.6.3-2-ksr"
    sha256 "b8137c078dc67e0570da5a1ec37c0c8989391b47150694f686cd218e1aa0eda9"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_armel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "039d3afc881d59bd4b48bed028f174d5d90d011ed5ff82fabfcade002eefd71b"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_armel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "a3455a0afe4fa1c3bf5edecc69f3d5c762834a579b914adb253daffe05a139d1"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_armel.deb"
    version "1.3.0-2-ksr"
    sha256 "9244d6496613a23e65911790768ca04b398c0544b0708c06da5355687140954c"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_armel.deb"
    version "1.3.0-2-ksr"
    sha256 "d2c677fe89283684f8dfea06edea2fd7da6dab14bf4408303ff90e8b6faf5b42"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_armel.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "a2abc82c259d16db0b3677d491ba135d05f69d9c7ac674e09d41f64446ddcd64"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "909187cc4b2591643fe315001eba1215bffe65ea42697ee1e3c210ddc43a7976"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "c88b56522039dd0564982655c4614771225f612532d835bd16057e962435084c"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_armel.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "cc2d27b22b81bde4c32be0aa3bccfc98cd58f00332ca8d44d706f68210d1a4d4"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_armel.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "e09baf3b04d803365a2480094ef88f2001f26be65aa8fc10e49ee196f0511962"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_armel.deb"
    version "12.2.0-14-ksr"
    sha256 "a2f661969e03e1bef75050cd09499a11e865194e0616f799fd0fd04c44d0c253"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.123-1_armel.deb"
    version "6.1.123-1-ksr"
    sha256 "794151490289d58c4cabb701662a2d7e60f2a829a8af27728511db4e59094a1e"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_armel.deb"
    version "1.4.3-1-ksr"
    sha256 "0eb02a4d4946ebbb5656df1608eb4e470b3449a39f144f1727cfa1ba19a2fbab"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=arm-linux-gnueabi KSYSROOT_FULL_TRIPLE=arm-linux6.1-gnueabi
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=arm MESON_CPU=arm MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=armel LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="arm-linux-gnueabi"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "arm-linux6.1-gnueabi"
    meson_cross.install_symlink meson_cross/"arm-linux6.1-gnueabi" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootArmLinuxGnueabi.stable.url
      sha256 KsysrootArmLinuxGnueabi.stable.checksum.hexdigest
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
             "--cross-file=arm-linux6.1-gnueabi", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/arm-linux6.1-gnueabi-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/arm-linux6.1-gnueabi-pkg-config --cflags libcrypt").strip
    end
  end
end
