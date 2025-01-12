class KsysrootAarch64LinuxMusl < Formula
  desc "Sysroot for aarch64-alpine-linux-musl@Alpinev3.21"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "47ce48273bc35949b13c4498c33da212ee46135e325d0e6b2cd77d4461d4e481"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "f9fa19072d1f1a4f72631f3fd090a85a48b95fa08b2062630ea96813275e130f"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "4d447fa0868e4f88671da15bc39955c1d5caa0a13dc257a77f7b13c23e48f3ce"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "faf2077330d808b5f7d5ebfcff6164364f886ebe25fe14510f0dbedc3476f02b"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "ed1a63e5cd4f89403272bd145e085acd631cf84d09944e81a7add95883f9e301"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "8afbb130d4b3499cbf07540ee20f5f0f163951c8fffa04e9a0e495d775c77aa0"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "7cfdc00f102d3b98fe563b31e7a59a7b7ab61850c1751915f34e419e83ef2653"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d03f9901b5f262581d27c4f2ded5fe07d91e8857911020a6cce20c2dd2240532"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "93dded5af4e42ca59a2e981ffc5acc59c5d7110cec4adaeb15b84dc224526b63"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "b347c2689cb1815510419dd68918c20649f48b0a7e665fea4cd8155dfa7adc9c"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "7f1597ae8ec8c4e2caa8eb5fbb26ff6914b03b7615f8db297c7908545027657f"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "9297f4c0bd68795a163411011bafb8b678f00ee16b82c07a141466cc25ddca96"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "38a3ff826c3d4a5b8fc8b918ad881ae83a094fa52c57c04a8a0e32e923cce163"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "44f18f617916d1896e389d061bfe0d1d7118778f307825596acf37a72f37f0a2"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "8dfbb9d12cfb21b0e5d24f8e5828213311ae981353cbe746a55c6b7940ed680d"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "2a15740cf272bf3babb438b675f0f894da0b4fa07b42dd86d0d07aee69378251"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=aarch64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="aarch64-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "aarch64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"aarch64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
end
