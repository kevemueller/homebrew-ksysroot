class KsysrootMips64elLinux612Gnuabi64AT13Debian < Formula
  desc "Sysroot for mips64el-linux-gnuabi64@debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  keg_only :versioned_formula
  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"
  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  resource "gcc-14-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "c7d3024dcace09707514e2d5620e4731a2d83f0fd6545789952590b92564c218"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "fa7b39b6542fcbd036bb3acc0ddfcf3824325fd8970458e141c6d93bd34a5977"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-4_mips64el.deb"
    version "2.40-4-ksr"
    sha256 "3272ccd197257995b2226c338476680e444b1cd6bb8c7b993fd65e995770f182"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-4_mips64el.deb"
    version "2.40-4-ksr"
    sha256 "0a134a1bb7fc5cc5bf72ed07ccc96dfa6cc4cb4bdd285f50a78e4e1488b54761"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-4_mips64el.deb"
    version "2.40-4-ksr"
    sha256 "432e6ca1325f5b5010cd1065d761bf8829edbc9ee5153db58f774d877b4272ec"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "ea6d2db7b886f04e3607cb56ccb34f6d1cdfee3dc9f7b6690e5363230a7381ff"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "c475e2fb77f86e8da427f45f7bc497b1b0fbfe6a185d57642d26eec6e88e3d8a"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "bb6d5129d2473447c06e20d1b2fdbfbd62a78ee12a04ac83045fd4d3fdd690a9"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "bb1468fd6acdef49ebdb143f4025fbc6bbd214f86e9801544d3b04eb04e5bef7"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-8_mips64el.deb"
    version "14.2.0-8-ksr"
    sha256 "178c7ff79147aec9021a0e1fd642b9610a20ec882d385cd92e75f8bd5adb935f"
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
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=13
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
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
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
      assert_equal "-lcrypt", shell_output("#{bin}/mips64el-linux-gnuabi64-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/mips64el-linux-gnuabi64-pkg-config --cflags libcrypt").strip
    end
  end
end
