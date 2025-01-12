class KsysrootX8664Linux612MuslAT99edgeAlpine < Formula
  desc "Sysroot for x86_64-alpine-linux-musl@Alpine99edge"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "binutils" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "907fcda6408913fb6134de1020eab818b23f7bda4bca387ce4347e3a9ccb97cb"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "14a72a670fe18c62d72adb13c3a35c91bdeb7aab56dbd5dca10d1ea2b9966a64"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "fed54421dbb157a81c01ad3345c6ebb5a7577bc61f57330ce39f64466e3d67c0"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "86ea41b4ec00a0025437eea4633b06b7a36f1feddf50170eeef972ce0ccac23a"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "2d96d3905187660127ed1a280f645f5ff3fac80d1ec02d9f224ba838ca340f3a"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "a576ab47e9082415992c2ecf335b6bc14c3349efc5bec4f3133138e5397f01c8"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "4cf566057dab26aa546c87c0bb0e5dfaf0c26f57b08e686efedf1114f44ddffe"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "1eaaa239301bc125de4ae8ec61be62a26f2a965c8d6de46861c1ee31a27a3c16"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "b0607c1de0a568f0f7c29a6c96c5433875cc083704054b3600a8bbc30c6191e2"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "77a9bfe6bd68bda184a8688dc7920b769c5ede91dca89df8e82ab167c1e3da00"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "0163b283e0b8d5f8f7101ee37e9d1c30e99f49efdaf16f432a6cf0db1c03453d"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "aa002859a79f7cd26d829e51442872010a93dd852e7ee070759d02d375114204"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "d9df7509ae5c06d2b953c966d7a49f661ea25711ff713b83c030a2e5ae148442"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "d05581a6a0dcba01eeba8911e2a3b2fef8fd672d82ebc995e02fb4429d480958"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "b83eeca262a8d89fe27f7f38134cc4b2693c56fb319c707b08043d40f1b786a3"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "b7647903be761631c4e50ba73ec0bd516668e256d80c1a083bc4b444298ba57d"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=x86_64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
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
    meson_cross.install prefix/"cross.txt" => "x86_64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"x86_64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
end
