class KsysrootX8664Linux612GnuAT13Debian < Formula
  desc "Sysroot for x86_64-linux-gnu@Debian13"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "gcc-14-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "260dbc42b4c75adc02ac120aee781ef646c5d9cece75e870b98aca0a536f5567"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "664ae1d059c9ae5e731e8d3c2e8a1fea6d9acdc8a289b8238f21c2d06fa4bc87"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "64de160134cfa40669fa7b37d16cb78c1d4e0e39c2052a8b6a22abf896c2d4ca"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-5_amd64.deb"
    version "2.40-5-ksr"
    sha256 "67c622233462e8c2c255de9f10a7e0a8ffe039c6338deaf61f5e63ad170bdd76"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-5_amd64.deb"
    version "2.40-5-ksr"
    sha256 "e2579f5c9487d9afb616a792daa432c40f248e4e2d079dbf41a0d4ff2b6cb9de"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-5_amd64.deb"
    version "2.40-5-ksr"
    sha256 "10ff58cf2036395b91fa6329d880c556f6e224b33845a76ead6b57b4199ccc1d"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_amd64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "6db83379e5f09d34278e36aea0aee88f483eca92f315c73b5e4be5289c8c8d38"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_amd64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "64d5c58fe7d8eaa7edac8a3b6f4783ab50580b53eca8c79becbb0459e2942a31"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "b97df56dabe52580c50e778963c9eeeea14862b9e41daf5de3715e20ad31ee99"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "7b0ad82de939e5b3d9d6fa56f18aa7ad65371bab76e6acb9deccb5c63053bf16"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "875b47faa062e693d368cf159353825aad6300fcf18a97eccf33a5a26e1b9089"
  end

  resource "libhwasan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libhwasan0_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "7167103bf7b94c52341efc890e7aebbb35e0e0b753abd948d271422e5446be21"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "9d647db67e20d9abe7adcdda5c0341082e0ceaf1b414d5466a2c9d7f61345c7a"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "40032f055e8806d04955385f3b04b39830062a80748a4a3b51dc2173d764399a"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "dcc663ae14adaf251e3d3d0b6d77a537293dc6920e11f82287c721d993f3d2e3"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "376cb3b2d1fff77039ded1fe7f53eb27aac78881ddc622c439d78ed9da68f498"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "d77ecc760247953a549f5fe32f5b4c4c4498deaa09068955d03dbb560e4b09e7"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "69bbe75a142bbce5fa9ceb69f076dcc606ec4c00036d358ddf06a0e27300796e"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-12_amd64.deb"
    version "14.2.0-12-ksr"
    sha256 "36dc02cf72a5a8882e017388196e06e4e2ddf96e890aed22637c0cfee05cf018"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_amd64.deb"
    version "1.4.3-1-ksr"
    sha256 "32ac0692694f8a34cc90c895f4fc739680fb2ef0e2d4870a68833682bf1c81a3"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-linux-gnu KSYSROOT_FULL_TRIPLE=x86_64-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=amd64 LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "x86_64-linux6.12-gnu"
    meson_cross.install_symlink meson_cross/"x86_64-linux6.12-gnu" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664Linux612GnuAT13Debian.stable.url
      sha256 KsysrootX8664Linux612GnuAT13Debian.stable.checksum.hexdigest
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
             "--cross-file=x86_64-linux6.12-gnu", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/x86_64-linux6.12-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/x86_64-linux6.12-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
