class KsysrootLoongarch64Linux612MuslAT99edgeAlpine < Formula
  desc "Sysroot for loongarch64-alpine-linux-musl@Alpine99edge"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "MIT"
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
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "d5b08c0b018961726569b93ab66bb9062dc1a7e3b57fe057ef311662baa377ee"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "7a974ec2dd316d5cb560539413c7c78aa6bd9b0b88fb56dd6dc29f0401c11c30"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "93f16a57535e6f0b1f589ed6a36ca5583cf73243e5bd85cc3749f7555d9d00b7"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "acedcd9d0194ed82ec7a6e1ec524f1172a001883d8f2b93b2aed336cc43b46f5"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "094ec8a1a4637a04160aab3bbf734d52c01e5d6fc888b0d95aad4ef77ea0e023"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "b38424cefb9474e8ba2aef2dc7435f2407ffedf274ee93de4a999f622eb7e2f5"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "02759bed29deeb7924c83d7d6536988d5bac2c7e8482b649dfc58f2b2c0c1ceb"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "975b2c3055f5f4f8201600fb03c009357fcd510475c20b3a3fe9723354e355d1"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "fba76c4a0ec2ed2a9582ba1c332f240c0e6b64b412b81405a53db2e423470f80"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "564f08eeaa0c874fdbfa20945648fe90d99cf81f24324bc0d87827bb14a96f28"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "4f6f493bc2bec06029da770d59782465f297601608f1a8ae93cc79c0015267ce"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "7cfaf49afde6ecb5abaea9645e43f329e8dc3a4c35af7fac382af12afc4cf085"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "80dbfb98a61bd8b7a4043f301c22c1af18ed1cfaa16cfdb9795a64db0d92d625"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "93e34a069086b6e38d04fde288c92bd8fac23e54c83d3e93148354f24b066740"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "887db76eb0950c112e2ccd1ec59e39461813b8e68c4eabf82fd80c7fc1bf91ce"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/loongarch64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "4e94753f42b924a2237e64039785a07aa98b62ec83826737eba9f030740c79d1"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=loongarch64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=loongarch64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=loongarch64 MESON_CPU=loongarch64 MESON_ENDIAN=little
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
    meson_cross.install prefix/"cross.txt" => "loongarch64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"loongarch64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootLoongarch64Linux612MuslAT99edgeAlpine.stable.url
      sha256 KsysrootLoongarch64Linux612MuslAT99edgeAlpine.stable.checksum.hexdigest
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
             "--cross-file=loongarch64-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
