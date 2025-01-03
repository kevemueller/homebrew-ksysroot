class KsysrootAarch64LinuxGnu < Formula
  desc "Sysroot for aarch64-linux-gnu@debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "86cfa90d368dd023b251ce14624e84a99cb73989870de4671b73392ce88fb8a6"
    sha256 cellar: :any_skip_relocation, ventura:       "dc35e52248cdfb8b10b2f4c3afcaf3e5a53ee0e9459877c545cf0e7e7380f7c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "241cbfa1155194f8ee343264588cef718ef4e321ad2ff33ac72ff889abf805f6"
  end

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
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "e1f2fb7212546c0e360af8df26303608f7b09e123ac9c96e15872d1ec1ce3275"
  end
  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "7dbf07af4c6a5bb53e31f7e487c1c65f3168959cd4015d66f8d0fec660289a94"
  end
  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "25a32fd0fe8b083fea31d2819d50e7254a0b9e529477c0740bbb44cbe297ec70"
  end
  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_arm64.deb"
    version "2.36-9+deb12u9"
    sha256 "37caa42fd40ae9e6930e6e1b339a45422ab6e5fe4189a7287f08bca200d0ec96"
  end
  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_arm64.deb"
    version "2.36-9+deb12u9"
    sha256 "564ad8beb7d6d80620ed5f6387cd0da5e3bc839e0c43293b4233678e8366c283"
  end
  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_arm64.deb"
    version "2.36-9+deb12u9"
    sha256 "c32eb959732f0ea43e02c312e4fd2dde56cd372d7418437a4dbf4e5e9f604705"
  end
  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_arm64.deb"
    version "1.47.0-2"
    sha256 "0bd07f2a030f9e0346a80bbdf211fe3a55835dda70ed0e9d9da23f0e24cf4e99"
  end
  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_arm64.deb"
    version "1:4.4.33-2"
    sha256 "8f40a050f6d54b47b0972f77ea29932573e0e6b4521b833c9d825f46a9db8b75"
  end
  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_arm64.deb"
    version "1:4.4.33-2"
    sha256 "eea0ad76ea5eb507127fea0c291622ea4ecdbb71c4b9a8ed9c76ae33fc1a0127"
  end
  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "fb74956b50ec86fd82a7a20aede3047e728155da019c34ff4fcbd3e3b79bbda8"
  end
  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "6fce2268d8f3152a4e84634f5a24133d3c62903b2f9b11b9c59235cbbc1b23a8"
  end
  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "a2fd2803bf03384ac90a54f1179a29f2fb3c192f3ff483a3dd8ec6c3351ce5d0"
  end
  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_arm64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "b45d45af61d01bc2ec9418de43a0cd68b335eac09dcedfa50b51a4886050d719"
  end
  resource "libhwasan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libhwasan0_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "c64188f901ecc0f2dd5e3ff9de40d3b295d13e495ca13595f3f5a41615de1aef"
  end
  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libitm1_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "68b148cf058da8f361ee1bb3829c3ece1ae318ad956246d78989e0f2d80b4f5b"
  end
  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_arm64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "e10046d423820bff3e7aa9fda0f9f1a5344c2c4222db3ac539a606165c8275b6"
  end
  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_arm64.deb"
    version "1.6.3-2"
    sha256 "aac46cb6faec4e737502b3c2290b7b02f8ba04e8accd5af7fd07934df0c867b1"
  end
  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_arm64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "5896a3ca948d7c287e2eaa19baeec7cd6873fd9cdebeeea7f4069420da028185"
  end
  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_arm64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "b07c71b63b6db1b8afff17cff9a9abb36a1a80272ccba71be6768f72b640d52e"
  end
  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/liblsan0_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "ab6f08bdb0db2ae261f5f04af8bfbff9701f97324b30f72ae99463a795246f54"
  end
  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_arm64.deb"
    version "1.3.0-2"
    sha256 "baf8a2ef1e9faec26dd84e62d0e8b653f54d2211a7a89c1b67965aee8a3da790"
  end
  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"
    version "1.3.0-2"
    sha256 "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3"
  end
  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_arm64.deb"
    version "3.0.15-1~deb12u1"
    sha256 "468debe7aad7bd73592dcdbdab4d778558a4f538efd1b960f24e343fdbc0654d"
  end
  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "bc901784391be6a11f9af13c993514e3d8cceb2f584dbee0f59d97589e74251e"
  end
  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "21e971c5d3506f783b89efe8e12ac85081ddd9213e4f6529262bcfe95c326670"
  end
  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end
  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_arm64.deb"
    version "1.3.3+ds-1"
    sha256 "bec1ab917db9f30e08e209281ce5f073a2d4f7ac43aabb658780fccaa822341a"
  end
  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_arm64.deb"
    version "1.3.3+ds-1"
    sha256 "deaf9ea54f74cab6690b4bc0b427f05cbe62cc073580d84f5f18a8d9e2ece401"
  end
  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libtsan2_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "38c4aca9ef3a0301937a6786f0836e7e5e498d6b35fe961dd5868fe019b7e2cf"
  end
  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_arm64.deb"
    version "12.2.0-14"
    sha256 "145b39c5fa7e70daea98da0e1f66c133339c8e30f45a6147a1201297a5eac29b"
  end
  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.115-1_arm64.deb"
    version "6.1.115-1"
    sha256 "a402a5f2fa621468496f0e20edc82ab8653ddb8caa877abfbbfa8dc820950c28"
  end
  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_arm64.deb"
    version "1.4.3-1"
    sha256 "2915158484a5bcb7fe2124944e66f859e7fb030d8ec6a4478ce273d385708851"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-linux-gnu KSYSROOT_FULL_TRIPLE=aarch64-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=arm64 LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version} #{r.url} #{r.cached_download.to_s.delete_prefix(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
  end
  test do
    resource "testcases" do
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
      sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
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
      # build a C library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check pkg-config personality is proper
      assert_equal "-lcrypt", shell_output("#{bin}/aarch64-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/aarch64-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
