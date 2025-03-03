class KsysrootX8664LinuxMusl < Formula
  desc "Sysroot for x86_64-alpine-linux-musl@Alpinev3.21"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "binutils" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "2ed0bcca07a31da9ccd27c84cc3c02064eb7a33c4cc2496371a50022b096d8d4"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "6727367ddd0c58203ac4e9b96a30d371e92da64c4b0f7b1b2afbd512c80a61be"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "4b2790276c2a652883302a4f43712f18a666bfa50edccd95b71ae5d5b9520591"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "fad45095620e08c1410260cfef6723cc318dc9e554821cced49d263a9d1b4064"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "ccfcfbe5940220c2224c1d5b4ee282994ebf1419af6455041fa850413e58632d"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "888fc0cd460a584258cbec9a9d5cdea31060a23f18cdc9c75ff0fb9d35ff7fc5"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "8675867db77b5af11b88fd19186450333202d94cccd84a76a066dccd5b6e8cf1"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "86720fd442c4e48964d169769ad904fe3fc895b728767a9f2f79f2fb86bd3acb"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "5899f66390aba2ac908f0912fc62a49775830f523fa38fab406c1761821dfb07"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "8a2c14b49e5b3d75ec32d6f62966df8b1abad200ab9479172805ddc0f221e1df"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "a63431b3ae86d2b376d7b3a48bf3ead220983cf1d172b3339cfc899dbfdc6d2a"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "2493390b05fcaed445ca4fdbf3508422cd9a0af5b7051c6a63a832a65b549ff2"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "519519de10d54bdb041a8afbf47323926660ed1a80c9fc47ab994546a0f97e0e"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "71bfd5187de9eea89e70272e6801e2f1c5f0b4614b562ef4e048ec06201ebfad"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "7f1e06186355948bbf1c2f616326a490e9edaa4dda49c28ea40f6f707c6862f0"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "45a06bfc107f44502b7e0503fcd5c8d2d2e6cff255134ed959275eb99caf9979"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=x86_64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="x86_64-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "x86_64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"x86_64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664LinuxMusl.stable.url
      sha256 KsysrootX8664LinuxMusl.stable.checksum.hexdigest
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
             "--cross-file=x86_64-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
    end
  end
end
