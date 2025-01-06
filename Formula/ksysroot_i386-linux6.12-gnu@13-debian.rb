class KsysrootI386Linux612GnuAT13Debian < Formula
  desc "Sysroot for i386-linux-gnu@debian13"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "10902651316212f05dd912668c054dd838b3bba949edfc1903fa26a077081f0a"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "b74f983748c60e4c6fc89991d74a610d081244d2858f8af4d91c8a3b706ea786"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "41994186ba593f50f2a1908e30e3dee30b70a821a50ef61a3fb1685ccfcb6407"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-4_i386.deb"
    version "2.40-4-ksr"
    sha256 "0c336e873dc95c43e0c9ab93c128f6ee63630f2972dbbae4544f5a242c25d08e"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-4_i386.deb"
    version "2.40-4-ksr"
    sha256 "942094e81d016e716a75b141ec92d4042357b1e777f987bb2367969cc994fda4"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-4_i386.deb"
    version "2.40-4-ksr"
    sha256 "cffe8d4503110ed744626b4539ca9e756749de491906c88f214cc5a094dc704a"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "91ddbe5f1e6dc3863a9dc178f2ca4d2bc37c1f8aac3756d468949928f57db7a0"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "968e1c78858f55386d6b674cc61922d827437b5e249ee38862034ace629d451a"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "8ada5e03001327c6f2b41110c4f5c050f8b7273f9b6b301acf783e125f3867f4"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "f6bca50c5c3007ff43e71eb53f6761ef2695f69833f5abd784fa3941820e85fc"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "01a0cf9afd8cbda12de02f8cbbd4652384747bd80b31a8898bf9f9a3f382a75f"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "fc89719fe619d7121d3041b1ba1e790f805c0b2d884173e2677c69089d0cf5f2"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "bf3fc87428782c63abccf82b8a9724b6a1cad48f4994bf7fb911f554c12a3923"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-8_i386.deb"
    version "14.2.0-8-ksr"
    sha256 "96f98dfc99cf2bbb196ff4d5a07188930e071f7ea6b11f653c40eb4e11b0dc50"
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
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=13
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
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
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
      assert_equal "-lcrypt", shell_output("#{bin}/i386-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/i386-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
