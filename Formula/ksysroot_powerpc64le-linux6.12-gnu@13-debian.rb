class KsysrootPowerpc64leLinux612GnuAT13Debian < Formula
  desc "Sysroot for powerpc64le-linux-gnu@Debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "1625e286f58bdea0a86bd0091e8cad3c3ae0179566c0189578c052cc9a0139cf"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "7902cc8359d68eaebec733ee9cec3404d441755bd0cc888d612559dfb8bf476f"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "1ab836a4af709bd7f901ed152af7f6504d0510d4f9da3205568c13fd40383f98"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-5_ppc64el.deb"
    version "2.40-5-ksr"
    sha256 "833ceaf8883b45ea2ab342034b87dab767ea16896d8705f39c3e04589357477b"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-5_ppc64el.deb"
    version "2.40-5-ksr"
    sha256 "66198860eacb7bf46ced9c56bca11e2e8ab780515ab8de7d52280b501b336fbb"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-5_ppc64el.deb"
    version "2.40-5-ksr"
    sha256 "f3980564b007a943b93820952817ba015d74b98cc939d90470946ab02b514fb7"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_ppc64el.deb"
    version "1:4.4.36-5-ksr"
    sha256 "ed15b22d867294df025e273235f5ba6106cf8b17695ee6da22ec2c021c12ad6f"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_ppc64el.deb"
    version "1:4.4.36-5-ksr"
    sha256 "d9be4e0b0c8d53c95628c9285c22257f56dfc88d80dec9e2e4d39fb52424d300"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "91d093c7dae832f70643eceb5a0453926b5bd9e0556d9fd07c3a2da9779b8201"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "9d4e44fde8d7bc546dd9c70cbdb583e1b94ce510a32a3b5bfd34d7db0378004f"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "a820a916da13948295c3469660de56f01be486eb529c76e3fcf40967d9af1acd"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "ff1ea6ff8a8adf5394961bd36b393ec244db0826a5af20b736d05ccde7ade42d"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "c9374c8f0343de203fdeb5d3e3a505c9dd6afa55455b85dfa0efe80ae80674f0"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "e9b002cd7bdc0c1b899bdecf681bc263f616673d2f0a1b6e65d61ed445b33aa2"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "83cefd33368887074b4d84aee7cd36850952a6eea45642dc34fc754fd31efa40"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "6cd18519ffd716bcb49223073b4efae12c3ad292d4addf0def319db58387cf17"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "cded9978cd1ac39ddaecea6a6c3a9a67bebe305382fbcee215ea620280fb617b"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-12_ppc64el.deb"
    version "14.2.0-12-ksr"
    sha256 "f8da3e47f8ac589ddd82cfa7b47b79ab57d86a308a0e070be9f8eaf27f167073"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_ppc64el.deb"
    version "1.4.3-1-ksr"
    sha256 "6478fe8b42b7566f6569178d1e50a4f102ce7739e8653d3bcf5a78096bf8d6f8"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-linux-gnu KSYSROOT_FULL_TRIPLE=powerpc64le-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=ppc64 MESON_CPU=ppc64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=ppc64el LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "powerpc64le-linux6.12-gnu"
    meson_cross.install_symlink meson_cross/"powerpc64le-linux6.12-gnu" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootPowerpc64leLinux612GnuAT13Debian.stable.url
      sha256 KsysrootPowerpc64leLinux612GnuAT13Debian.stable.checksum.hexdigest
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
             "--cross-file=powerpc64le-linux6.12-gnu", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/powerpc64le-linux6.12-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/powerpc64le-linux6.12-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
