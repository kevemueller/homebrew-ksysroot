class KsysrootPowerpc64leLinux612GnuAT13Debian < Formula
  desc "Sysroot for powerpc64le-linux-gnu@debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "GPL-2.0-or-later"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "e58bb76ff9cf8f0fde08d4ea3c40037960f17beb816f20de208e386247d5a8af"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "5392b7d2ef2154c4d5235f85f70f17474ef8c422bdbedd0340d92c519813424a"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "bbf5e4a77583f7a8af01be982d21a14efef97abcfa33bcef8ee98843d57f7c8c"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-4_ppc64el.deb"
    version "2.40-4-ksr"
    sha256 "29427161f0c44b3943114681af341160cac5a33ca09e5f5f5bfc4e56c67b6e22"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-4_ppc64el.deb"
    version "2.40-4-ksr"
    sha256 "56696f19a1fad155ffce9b1a8dc5d765b7c056b5ba8c350238ce966a909085a6"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-4_ppc64el.deb"
    version "2.40-4-ksr"
    sha256 "5e9c0ef903886b99e2f5ed05aa1e9b9e33061eb2a75a41b4e6914e96871ec1fd"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "7fb81a2b01058d74dcbfb87a9a48b6c4f39359bcac0034d1e9fa951e46b3ea08"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "b794b439d046680e03427840cb75518f5fd92b16f2d980000bdc09581a7bba63"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "64d801516747b70ec1cf90cf2f85f879eb0626e2ce226a1accecdba95fff0b64"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "370726aca174462597b15f3b5697f08af02694744e583701de8f664a5f642f31"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "be1bf19d43d2aab402e0c54bfd295588e60d70acfb0eb876a033c9a19ba93c93"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "37f1767d9cf854f33eb190adb7b1f23fd7fc057d7f2f0bc590f36a10705c4463"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "9aeb2ef493dece7ade423a3e0faba299cd0f7b23e1ae5f47d9dd208b833657b4"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "a2e7b42e5f5c843e43842fc559c485203bcaaa830ec04d15acdb7284c0587564"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "deb5845e89bc61d56fad2a0054aeb9f2eda34d5bfcf00c9f2e4cdfaa99354889"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-8_ppc64el.deb"
    version "14.2.0-8-ksr"
    sha256 "3d516d1ba1eac0e55c557f1113c9af09efa82ea256c045eb7e0f8eb6d6b3efda"
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
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=ppc64 MESON_CPU=ppc64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=ppc64el LINUX_VERSION=6.12
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
end
