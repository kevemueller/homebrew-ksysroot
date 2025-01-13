class KsysrootI586Linux612MuslAT99edgeAlpine < Formula
  desc "Sysroot for i586-alpine-linux-musl@Alpine99edge"
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
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "6239694074bfeac174436051e1afe9fb0b5d4d1422d1eedfb409c8f2824f6f3b"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "55d1ec2cde3249939af8355943e0daed95dd5f07216d68bdc837a331d49d0728"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "951992d961e8d2b6c9e77af4d5b5f12a224eeb73a5c21931b5ab9b2281cf6aa2"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "4b042489aa327f4734d2ffad0e671a10bcb283ebcec0f5b602d0b8eb1a50c345"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "20ff5f8cb9471e28c6a06ba611018212095ec9ea3df49069a0462ab908d61bc1"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "b1c49ba89f1a07a5ef4a0938c353631994a0122a938a514e8dea851106e7576d"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "e399178c348eb57a2798b6c93ee704ab7038dc477912b081a3002758ed660104"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "dbb374560b6512e79c396e00d8609c0d7dc2773d006e64aa9676b3ccc217ed60"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "997200ef866f1c9b9688f604eef54aa02ce1a161454f28fdcf76e2509132c930"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "82422cdd1def664d06fc0eb7794918c455cdfaa942122ded1e0582f78ef792bd"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "97419050971662d243968eb799979539dbb735c5fd4a71f3bb3ab506e2085ded"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "c6731a67c2ea357a5fd2cdac969bd11ecd8db7362be391eb27c6c39b729a547e"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "2c59aa9971c9fabd86e6bee9e3534c49d0f1e57327e305840f6f913d2b024b9b"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "89e2ba0ec571a37b1d879aabee362591903280e2716375d8e54125c72de44f2e"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "062eea1b051a4633fa03b4e55ba4c517be55203d7a0214ff3a8cccda9eb7bc13"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "f10633b9cc5f81bbf86a9bc3495026974fdef58582476425105025204aebe644"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=i586-alpine-linux-musl KSYSROOT_FULL_TRIPLE=i586-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86 MESON_CPU=i586 MESON_ENDIAN=little
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
    meson_cross.install prefix/"cross.txt" => "i586-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"i586-linux6.12-musl" => link_triple unless link_triple.empty?
  end
end
