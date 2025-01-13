class KsysrootPowerpc64leLinux612MuslAT99edgeAlpine < Formula
  desc "Sysroot for powerpc64le-alpine-linux-musl@Alpine99edge"
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
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "d2d91d127980d1eda71a7e61c29a92c6752f9fb8553d1636d691f66d1bb0932a"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "fba8c38ca9dac6de7d8e1e2bd841c99fe3682e5bcbda57defe79f0cc927415e1"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "9daae50dac2f45e4cebfca950354df652095500c3aec33ec9d427c347db21e83"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "b5f4da030b1bba2e7d8cb6992d1d4a8092d124cc1a68e2736d9e76362fb8735a"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "2b20bbf575d05e30a2549202f493177ba3eedc631ac5c5b42648d033e28174a1"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "d2bf44b24be53c4d6ce83c693cb55e052ccd4a248e410cb6846687105eb5e7ac"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "f295825b0901163c3b999b24b74c4aae2481928c5cb3d830fb0c01ff9981407c"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "fcae59fe87faa7fbfb263ab320e7d673fbb6a9ee63826c78e04e2b59bc9e7bb2"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "fb748950fd83aa5fec97f3c626e66953a40be3016b96a55bb8c48d54dadcaf0d"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "9c6be85d703c95e881eb2d63893700f710df65e5693da551d57d1bc6bed639d5"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "043411796fa5bf11c6f1894d25e688d4a18a02294125541d2ffe39f4148aff62"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "237dba4446dd4b0d63de29be88fb0972ad3f973654ba1993173ef09c69782566"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "ac5b9b8aa20f194f2ae4dfedc314c7e34fa59a4942a0369bc07dcb49d50114c0"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "4367ceea6e9b252bc069f5224509cf0a7d96c1411af386955d22a9fa534c6e9d"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "33ab0b195a4f615dcb15b8d8c42d1b8365b4bed529a70fd00885f3660e853126"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/ppc64le/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "55b14bf10fe7a08e23efb4a02a1032a20c25892c2a4e5d84721a11cdfb303eb8"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-alpine-linux-musl KSYSROOT_FULL_TRIPLE=powerpc64le-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=ppc64 MESON_CPU=power8 MESON_ENDIAN=little
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
    meson_cross.install prefix/"cross.txt" => "powerpc64le-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"powerpc64le-linux6.12-musl" => link_triple unless link_triple.empty?
  end
end
