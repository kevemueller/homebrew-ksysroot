class KsysrootAarch64Linux612GnuAT13Debian < Formula
  desc "Sysroot for aarch64-linux-gnu@Debian13"
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
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "a8a0fac7bda3ffa5dc18fb9f408de96f0215e8db84e2bb1ea0a70167ae4ceca4"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "a498659c6d492b8186986ddffd4078bee80d14f48b0222021571217dccada698"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "a06ceccbfd0b707145263c983efbbf6550aa6f4589ef6ce0f03312b61de89d60"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-5_arm64.deb"
    version "2.40-5-ksr"
    sha256 "d9039cc7f724c1caabd458c761ddc90914bd0990f60e7f9e2415ae3274d53d30"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-5_arm64.deb"
    version "2.40-5-ksr"
    sha256 "3f8808a78639512246729107138fc80f962390289abc47204c64e2b241542a56"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-5_arm64.deb"
    version "2.40-5-ksr"
    sha256 "1706a98c77e90dc30572ea753a0f32658ffaa49d7ed2470c18d8d6d1a1741905"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_arm64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "30621cfd1d87c9116fcde9fd4779f8e99e4d4e5e39ebc60a36e166397591da14"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_arm64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "87ed379a72a42a6bf1d21abc5e4a38da0ff5b76ba6143705931a88c6abf9b082"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "c6cd62b730fb50ba1cc9a35d22ba15953605783856fca2d50c07eab9775046de"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "91e6c1b245862fc833f6ce37c53b851a0ddb38b045b0652d4835d3da9c568b47"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "d98d7de2368dd89058360dd8e04753fe0529104fd7628a8fd7be9476ea496383"
  end

  resource "libhwasan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libhwasan0_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "e0ec0dd2a432cfdd63cc3ff880a09c95076066804c250af4e213369d3a666de8"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "db76d862ef9366addf17ed3679f9f9ec4a9282b4a051aab81aaa7833f84f05b9"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "778941055051c2cf079c0460be038f3fce700477d56e226001ac5c272c8f37ea"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "42d50b20027f1fac3e043114a1f623ae290cebf37b0741bedfd54218c09895fb"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "cd4e8215d48c32d5ac54f83508105b84bb32686095e72fdfa488048dd38cc207"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "de2a05925736c0e8d68dfeb43e225969a0ee697289be2bec99baf243028198f6"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-12_arm64.deb"
    version "14.2.0-12-ksr"
    sha256 "94d82a8eae45300dfc556130a64d69f6ddaf207330e440a3d5616f8a1b2133fd"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1+b1_arm64.deb"
    version "1.4.3-1+b1-ksr"
    sha256 "6ae3c216e6c7d8e042ad3f122b8aa89aff56b2b5174b1c5780a7841b3becd61c"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-linux-gnu KSYSROOT_FULL_TRIPLE=aarch64-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=arm64 LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "aarch64-linux6.12-gnu"
    meson_cross.install_symlink meson_cross/"aarch64-linux6.12-gnu" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootAarch64Linux612GnuAT13Debian.stable.url
      sha256 KsysrootAarch64Linux612GnuAT13Debian.stable.checksum.hexdigest
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
             "--cross-file=aarch64-linux6.12-gnu", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/aarch64-linux6.12-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/aarch64-linux6.12-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
