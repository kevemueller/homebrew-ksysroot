class KsysrootArmv7Linux612MusleabihfAT99edgeAlpine < Formula
  desc "Sysroot for armv7-alpine-linux-musleabihf@Alpine99edge"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "MIT"
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

  resource "binutils" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "9e0ed6f791c2136aff0f23db2ca17ec9d2e1523d5239785b2d6d58bccfbd8d2f"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "5c71522eeaf9e55109404e5497b7c7cf5231e90d30bed5379fc0fa8bfc7c51ce"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "0d3503c4ce4aa9d5410d425facdf95e54f14dbcc0712d727abff50043c40c99c"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "3c9005a1d30f59e98e7189f154587571e02fecad5e39a288e4f7631fa47ff515"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "3870037fac970388e2b6b4daba6ac44653830dec5600aeced7a425daaa22b27c"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "6728a93a6eea07d93ff554a989d869e854acdabee7754fabdfec0afad001aeca"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "0666612d6be461f4e8e889b52c20f038a46cb43956db4b2bcda0d92edcb82b4f"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "95971411fef7c2f5a4d38963ee08a851eb37e71b561d5bb20d6297ad43ccd0f7"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "4992b7dc7a1b78b74fcae04bd10f6efada2c007e9f074fba1b35fc8502c52b77"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "de6781860467ba1b886f5338aa85caad7e1b17587f3d1d4cadb6152341f66e7e"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "c42aaf1c0296b146cccce8b715341c6d172aee24aef48fd092f0a6fcbbb20f44"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "fecac2843e15c8c0ef956da639083a0fe301cf6307788832bf37a015370ba7db"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "61e87c303d4a44fa1f1fe3c974582347589d2153445bc2ffb212039e4913cdd0"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "2598fff70a00a493aa1cc1f1ae6c54feed67ab2291731e1e7be7713fd3ac6d0e"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "822a66c1270a8cdbf53eae41ec5bd4c5fdda0abe52775cc59c43558bc922b77b"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/armv7/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "5440e2b1d893640640bd58b3cd8bb1c472650059b4aefd89aa4102dc93bff5b5"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=armv7-alpine-linux-musleabihf KSYSROOT_FULL_TRIPLE=armv7-linux6.12-musleabihf
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=arm MESON_CPU=bcm2709 MESON_ENDIAN=little
      # ALPINE_BRANCH=edge ALPINE_KERNEL=lts LINUX_VERSION=6.12
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
    meson_cross.install prefix/"cross.txt" => "armv7-linux6.12-musleabihf"
    meson_cross.install_symlink meson_cross/"armv7-linux6.12-musleabihf" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootArmv7Linux612MusleabihfAT99edgeAlpine.stable.url
      sha256 KsysrootArmv7Linux612MusleabihfAT99edgeAlpine.stable.checksum.hexdigest
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
             "--cross-file=armv7-linux6.12-musleabihf", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
    end
  end
end
