class KsysrootArmLinuxGnueabihf < Formula
  desc "Sysroot for arm-linux-gnueabihf@Debian12"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "10d3ac07a0e9e1c5919b26375c505aa81fb8df2e56d3e13aa9e5f069e25b7a92"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "44a41943b96f94401cc98482903079df1f11a262802ad03d7dd018efbb6b47be"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "40f4a6ecfe3644e1fadbfe5bbdbdd4f5065c199678f31c92ba1c6e43cd154d31"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_armhf.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "9951de8f5c85b3a4cbdb58b71532898e9f2f77933430d3d380f73d6d3e94c4f8"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_armhf.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "061fae9751fab7a52f204a33d1a5ef4d0e67d7d15cc012c0e2e7ea9c94ee724d"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_armhf.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "f2810e289f512337f3dba626dbd141c62435dc1d8b31af0e4bf0ea903e0cd30d"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_armhf.deb"
    version "1.47.0-2-ksr"
    sha256 "ba8d34c6b726fcce055e5f26ac74ee3d7d8cd12fabea859b6778ae604d08343e"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_armhf.deb"
    version "1:4.4.33-2-ksr"
    sha256 "57e8ee416fab69ed529c0ff4963f60e590613df51e46cb2293cdfcd23e10abc0"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_armhf.deb"
    version "1:4.4.33-2-ksr"
    sha256 "6bb061a2279a27ff61791cda6edc8925455e5423e475e5e6c41ad7e04d8efc3c"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "f913cbaef06f638dc6b78eac1166bdce0b165d63f5cdc52408614e2117c842f0"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "6eee90afd6976f6a4f34e288fc98a57f72fbffac442ab28d860630d85a15e5d7"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "59135191d9054cfa01e6f005a27e2e3dbe571ee3b4e4d76e4283a723c894ecae"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_armhf.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "41a14029a724609cd6f94936514dde219e5bde253049520f3211081a1b2c9722"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_armhf.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "25dd16a24777c6a2e7eba5d3e21268c5bc596b1fe4fb74b12634f15184c7320c"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_armhf.deb"
    version "1.6.3-2-ksr"
    sha256 "bfc6a3a668b58b88876b9e37192f669ceeb68db6d50c8374a9267a2bbd8f8a8e"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_armhf.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "7629959854e0347c32ce76c3edf030d97d75fb397854aa793fae7755a39dda8d"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_armhf.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "58d6910eb05782985a79161544248cc6ad65e9f44970b7c58bf12bf5a36114d9"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_armhf.deb"
    version "1.3.0-2-ksr"
    sha256 "9ba25e4090f3677ea63ccc11da9b2d4ee80e365fa091658e15f350e9f76e3458"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_armhf.deb"
    version "1.3.0-2-ksr"
    sha256 "a38fb6899749f74ebef429d7b20f1d0f962e2187653c82d66b8bc83ef694efb2"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_armhf.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "cf68f7e830233e891ac57f9bc3bc4e8021447710f0be21e394201f9a779e1d35"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "018abe767e1a6ed52ea9a79c149708ac5ff01317c95ceb5cc0687d395363a0be"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "50729c9e7c78ad33529dff20f55d6eb3299055079016973ef068ca2c5eb08eff"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_armhf.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "a9dfaca9fe304c32501a079251a2dd3732b4263fc45dcb248f45657b9f10390f"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_armhf.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e4c2942b3a24656c6e57fba8d72b18b234086f71f04928f51bd0039f3e2bbd8"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_armhf.deb"
    version "12.2.0-14-ksr"
    sha256 "cab98e76aebbe5da12d7eddd6a8656d2aeaa77419dc83699ea14915b544e0f7a"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.123-1_armhf.deb"
    version "6.1.123-1-ksr"
    sha256 "ede93aa7da6183e7fdfd7ad04151396d3d1aabd20fa15bbdf039edec0e9c2385"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_armhf.deb"
    version "1.4.3-1-ksr"
    sha256 "201134489aad37bc15cc28474f9965ae3cc5838e4f6aca771621f5dc8b4f4f29"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=arm-linux-gnueabihf KSYSROOT_FULL_TRIPLE=arm-linux6.1-gnueabihf
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=arm MESON_CPU=arm MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=armhf LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="arm-linux-gnueabihf"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "arm-linux6.1-gnueabihf"
    meson_cross.install_symlink meson_cross/"arm-linux6.1-gnueabihf" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootArmLinuxGnueabihf.stable.url
      sha256 KsysrootArmLinuxGnueabihf.stable.checksum.hexdigest
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
             "--cross-file=arm-linux6.1-gnueabihf", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/arm-linux6.1-gnueabihf-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/arm-linux6.1-gnueabihf-pkg-config --cflags libcrypt").strip
    end
  end
end
