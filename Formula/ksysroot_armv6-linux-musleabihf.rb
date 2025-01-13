class KsysrootArmv6LinuxMusleabihf < Formula
  desc "Sysroot for armv6-alpine-linux-musleabihf@Alpinev3.21"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "5de31aa32ee6a892c0fd4a393b0ca3d07a02584c58e1fc5b3333e8cc082b66b2"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "3db2121f7872457c1391e4c58aedef7fb716c5426dad503dd4aae1be70517d2d"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "603dbf595396661405c3bfcddf00a1be09ef2de1c99c497ebd5b12a55d278499"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "f29208e660e9ed7259caf2a3b7fba0a9b3945c4bfdf37ff90fe7e58a6daaf57b"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "79b044413e50c7fe094b620668f27cc0c648cdf37a01993758384fabbac1b782"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "f595e87b6322d739070ae1b91ab08df7ad6ed2029abd90151195c1732c24da23"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "5fcda414967de1affe244935d84a5f0d429d5ca11047ccb59058fb0d42ee8d98"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "2d42cf46f5a19eebbf6eb9fd6f9bd58b871cdde3a466b64c874b88aede7c1af7"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d06a8f54962811e1b48ef65836f3ef0f242ddae9d9317f0bc2e140136197a1cb"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "896c9ac66e2b174213db3cd343cfa7962b0e6c3673750ed16e749e2f494f369b"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "830dfb807d186c5b4f39e4e52b79f1906926370da150170ce995e930927d4f96"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "99e576b2af433f36ce7ff03677b2a36140b3170ba8d7999e268bac0f38eaa72c"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "5eb40dfc70670d5ad503f0dcb550bbf37e139ec2ad34d430502f4ebf77da6e06"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "47bd1c0d18dd18bb73c7cf835f473eccd763f52f37b64728db58d024f74642db"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "1de20fa615ea5df5ab1d10daf2f4147298828334a6c005a15e7e85a5e3631893"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armhf/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "74d85b1e768848392eadc198b23458ce190248d3a067713dba79f33e28cec29c"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=armv6-alpine-linux-musleabihf KSYSROOT_FULL_TRIPLE=armv6-linux6.12-musleabihf
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=arm MESON_CPU=bcmrpi MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=rpi LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="armv6-alpine-linux-musleabihf"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "armv6-linux6.12-musleabihf"
    meson_cross.install_symlink meson_cross/"armv6-linux6.12-musleabihf" => link_triple unless link_triple.empty?
  end
end
