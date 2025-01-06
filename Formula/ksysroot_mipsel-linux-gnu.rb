class KsysrootMipselLinuxGnu < Formula
  desc "Sysroot for mipsel-linux-gnu@debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"
  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  resource "gcc-12-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "290cce96afbc38ec0a84126798ed6a6e770fa6d45b94c2653f32854b4a09f7a3"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "ec3ec83f7bfaa73781dd4d69014725376fa6cd55948df1a31460513179ca908b"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_mipsel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "0834ed6c4b547f617bd1425fd95227074137176d79186a15675dfe1bd9b7e226"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_mipsel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "52e9cce202858ad579d956038ec3a537672012d630b391922d6dcbc2fae15618"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_mipsel.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "8f68007eea20cc1541c2ed762d302c9d2a41b665d2affdbe78981aab9b2d15b7"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_mipsel.deb"
    version "1.47.0-2-ksr"
    sha256 "b688a173feac9c2650661ddc7cac7fc0d777d53e4db9d379b5249d463a0e6d16"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_mipsel.deb"
    version "1:4.4.33-2-ksr"
    sha256 "d0e16aea406dbc103ebacc033a40f0614b3d8a528ca8b1f85fd442dc531426ed"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_mipsel.deb"
    version "1:4.4.33-2-ksr"
    sha256 "e97a694b091cdd34c1b3cd0decb05cd00ebff1b90eccd25d829a3e8da30710e5"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "647b0f263db3162bbcf1362ab517ce5d5edda31132a4e83c95897e2e0d84f1e1"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "735d2242f562fc7a76a2171d944dc83570e7127d19970f93acd66a10a3c3f54a"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "3f02899fcb4c92ee0ad6cedee2ec0910bd4ce2520cdfcd666e6316e871c01a43"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_mipsel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "0d6fc568ee91b54771c7493f84f1eaadd236bbaf0cce1e87a786be2396a4ba47"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_mipsel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "a821177e64f02fe0b3e7eb9fa0859714d390d838c8d6da8b4a437cb643b909f6"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_mipsel.deb"
    version "1.6.3-2-ksr"
    sha256 "8b6295ef2b4523fd58c73081b658eb639c08068061c8aaad656f893ce1d9db38"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_mipsel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "8c05db1168e62acf035e1b9b5563294ed4a9249cacb84910547f9a858e3f38db"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_mipsel.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "9d77f6edde06d12e62c95cc09c4278e688444fcdb1e184dbebe35e96f77fb1aa"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_mipsel.deb"
    version "1.3.0-2-ksr"
    sha256 "37218982e7c3d022aae93a660f2968a15cddf5c35990066b27888c95c6c99a44"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_mipsel.deb"
    version "1.3.0-2-ksr"
    sha256 "cb30680634a5f41c02cbbe3d013a32e4fe4321e068effdf8eeac0a8d2f1ecade"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_mipsel.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "55fa0e59cc19a0ccdd3dda1c923c3356355ef0b8d121457439bb9e6a1cb27d84"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "82e8ab00f38e011b1b2b6ef9887f0fd569970ea8538af151c44afe3ba7e8f353"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_mipsel.deb"
    version "12.2.0-14-ksr"
    sha256 "4ec2a92d9cade1628b6b9ea51aad9e222f0b3c7bbc60698908193e791ef96218"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_mipsel.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "cd78d89b998b58eecb53f186a4430fe9352186cf45acac4ec7c8325efd2f3a42"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_mipsel.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "09cbf51f31f22c0a3429be7b6d637f1fa84ed0310d148523d62ace4f577aeb04"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.115-1_mipsel.deb"
    version "6.1.115-1-ksr"
    sha256 "9ebdf577d49ce3eb7edbc76c6e5e025a683f2900661fd840ebe0d9b32b5b982f"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_mipsel.deb"
    version "1.4.3-1-ksr"
    sha256 "ae21d84e2164912239fe7e3d4a33805eef5f66a6c30a225ef3977705f9d61e7c"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=mipsel-linux-gnu KSYSROOT_FULL_TRIPLE=mipsel-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=mips MESON_CPU=mips MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=mipsel LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
  end
  test do
    resource "testcases" do
      url KsysrootMipselLinuxGnu.stable.url
      sha256 KsysrootMipselLinuxGnu.stable.checksum.hexdigest
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
      # build a C library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/mipsel-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/mipsel-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
