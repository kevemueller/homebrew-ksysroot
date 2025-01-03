class KsysrootI386LinuxGnu < Formula
  desc "Sysroot for i386-linux-gnu@debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
  license "BSD-2-Clause"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "a68aa1dfa176765f7b36a570a8298ab18ab5b82272826fe2fdd25158315d0026"
  end
  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "8847b3db2c1bf1ee3d67b0803906de43d94d4632348ecedfe5d380f7dd13257d"
  end
  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "e2d1ea959b3681b3f1cc47e1473d39faaee414218935628d5b2f580e836df77b"
  end
  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_i386.deb"
    version "2.36-9+deb12u9-sr"
    sha256 "7d492454762b3017d905b804faa5011e73f86f7ee54c0035225922e0bdd47a19"
  end
  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_i386.deb"
    version "2.36-9+deb12u9-sr"
    sha256 "6d8960e1e8f3c430252a6459b79fc38a99cf15da6b20f56fbe9729ba81608c70"
  end
  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_i386.deb"
    version "2.36-9+deb12u9-sr"
    sha256 "527e23b6a01e8e14dd46d09f03ab22b22a4915f5492462133976228e728ab681"
  end
  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_i386.deb"
    version "1.47.0-2-sr"
    sha256 "22495569081a4da5b932b739deae00cd6e71aab74f50824e3ada83a2610ad1b7"
  end
  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_i386.deb"
    version "1:4.4.33-2-sr"
    sha256 "21abab6e2b9238fa8f65f29fc6d8fafab5b44afe6063c53c882a7acf77c6bc9d"
  end
  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_i386.deb"
    version "1:4.4.33-2-sr"
    sha256 "bbed3f2db1b1e800c7356212b4ede73ebb28f73b87857931dece725601aa67ad"
  end
  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "6848d93a4cf3c4ed09f7a3a28859ba9d8a5e467c45fe6490ace9d1f3b3cd68fe"
  end
  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "c22f4115a4b66b56256a6138457fb7630a73bbaa1fc63639060527f7366f0cb1"
  end
  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "ccd0b87ca6cca335b033e4cd3edf7626d55d6bed8fcef30d8a1b04caad0cfe38"
  end
  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_i386.deb"
    version "1.20.1-2+deb12u2-sr"
    sha256 "9e243ac095024d9ace3737cf1b275eca2c0e3724166c6390776c5f1abf044858"
  end
  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libitm1_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "cda6cd006da7256668ad2f27ac879e57b0f4b69540202c692dc7945e6d9bd879"
  end
  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_i386.deb"
    version "1.20.1-2+deb12u2-sr"
    sha256 "a9d7fabee70c9e6bf9c83b10444e40a93e34f1ba26e9e6bae5ce1b8c2b8573a3"
  end
  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_i386.deb"
    version "1.6.3-2-sr"
    sha256 "124ebf5b8307e2182afaaa166f057144ccc7132e2391164bd86d6c493efc94ef"
  end
  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_i386.deb"
    version "1.20.1-2+deb12u2-sr"
    sha256 "8df6321b4b5e1c5912c2eeb584c4d071fd23e9fe5d17777a8380634a96ad113f"
  end
  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_i386.deb"
    version "1.20.1-2+deb12u2-sr"
    sha256 "d99354b45eed3d82cf0d6ba8d37f3e777ca19f64d125cd19d898df1ff95267a1"
  end
  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_i386.deb"
    version "1.3.0-2-sr"
    sha256 "5a43613d8b2310b0eff2da4bb9f7d308ce7e3a2e71fdfd2bb86bcd26da3680de"
  end
  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_i386.deb"
    version "1.3.0-2-sr"
    sha256 "0e4debdf911886156bd41ee47104f35af73a29a2fabbd732412b19edf5de4825"
  end
  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libquadmath0_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "636a34f37477182a05867e69f503645636e5f5728c02bf01be7b7fa8f7cb909d"
  end
  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_i386.deb"
    version "3.0.15-1~deb12u1-sr"
    sha256 "801bb52cd528e21faf672d80602a962e57b86d418a209ac6a9e0ea25f91103f8"
  end
  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "76ec969af8899597f33297af99ec8d90f81a4f63bdc7c970f6fdd981b0a4beb9"
  end
  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "65c7019980b204ac150faae399eac921574e0ef273f83c0485a21daae1c57551"
  end
  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-sr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end
  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_i386.deb"
    version "1.3.3+ds-1-sr"
    sha256 "2996d805277a22e26329adb3c7e7f4a73a49623650232666bbb74f1787604b35"
  end
  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_i386.deb"
    version "1.3.3+ds-1-sr"
    sha256 "42d387e48a464c2ee90c34598f3159c44f48b6e885c7bd3f57e65c607619887a"
  end
  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_i386.deb"
    version "12.2.0-14-sr"
    sha256 "b9c64b5ff919cab141c4bc8c5b49711adba46e76a58c415e119edd8bf472a9e8"
  end
  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.115-1_i386.deb"
    version "6.1.115-1-sr"
    sha256 "e904c629a777539713cdc2ba757ad8ea6c04e79b60f95384eb9d054b60e2d11a"
  end
  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_i386.deb"
    version "1.4.3-1-sr"
    sha256 "3900d246041e9cd5c7f69a08353c27c62360e9233e9e6032e6c732f767b9bf37"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=i386-linux-gnu KSYSROOT_FULL_TRIPLE=i386-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86 MESON_CPU=x86 MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=i386 LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-sr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
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
      assert_equal "-lcrypt", shell_output("#{bin}/i386-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/i386-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
