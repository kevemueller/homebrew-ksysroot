class KsysrootLoongarch64LinuxMusl < Formula
  desc "Sysroot for loongarch64-alpine-linux-musl@Alpinev3.21"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "f6a173591ecaf14506ced5e2d949cf3c3fb6b9817fa5dd68071ea9e62aaba72e"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "c9097003d9814c84b9c285182a51d40c405305b3936d28d857b5629f37b226de"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "c22fa89b16977a87fa172bc381521087d5313937020c21200b19efcc10f9583f"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "4bde01394e9adf19d88ae718de2a380d0ca285e8ede34dc7aeabd41a341d00dc"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "5f4364348ac3e9aac5810da0690c7548e36ac8db6ae91be993dcb7c3f9c1099d"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "bc2f2731aa66d39e00e3e0b081d83b5a5cc318cc54f1a087e70ba14846918b0b"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "45c1935518a90d1c0d0dfc969d9ae6b3c2055e22e4341107c3877846431932f6"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "858a724571e4148a3c922b513e504611af1a4dbc089fa0d5f18d29f28030ceb1"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "2e3ab173281d3e1d1f3cde905baec6f4d5192107a603dcf1d3b7c5921011c5fd"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "df224c718862d84c3acbc74fd1492edab02442e6254bba099e5f3d2330c4bc3b"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "777b8c152a6ddb348f3c555b1070ec40002a8c206befbc3ee2746bdd3c2e328c"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "8bcdcde04f578b985eebb4021dfef18b0d60973ed8d4a5f18f7ca0d54e15ad38"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "36fe13a2b90872d7d3b89be8886e1249b46e7388cd50a85c9f60079a8661f319"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "ff269817024a0505c904b39c42254551e56db6a236fd11bcb901855345b7e775"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "3b299031ea220e1ca58d7324f197fd85a5947278d51b65b58ca429fceb2db4a5"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/loongarch64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "3234469befcbd9a745f4663e6bab151f2255c0a312aec942139f66368580d1bc"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=loongarch64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=loongarch64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=loongarch64 MESON_CPU=loongarch64 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="loongarch64-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "loongarch64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"loongarch64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootLoongarch64LinuxMusl.stable.url
      sha256 KsysrootLoongarch64LinuxMusl.stable.checksum.hexdigest
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
