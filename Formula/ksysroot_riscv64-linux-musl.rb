class KsysrootRiscv64LinuxMusl < Formula
  desc "Sysroot for riscv64-alpine-linux-musl@Alpinev3.21"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "59bb0ea366c9042b1f3f3cd33e5e0705de0c8d2f123d4d5d12192ac24e8b71c1"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "ea7d05917e34a40d49885a42604460db179763ad215013f3c3c37d89df1a0311"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "3c9be900d113c469fd4f444868604a7a0feb28a6551bff9914d0719c74fe0a35"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "dbd313c08b527b13cd17d13a8e57acdd9d57971ed685a00f14e19d9f06bfd4d3"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "5f9c0a78eb8c0a39cf0b172f2256aadc4e4e2ebb9fa454e772a06ff2ef57725d"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "6809ec5d4b8371f69f12e820c7c33361119a9a1670d57c51321487cdd7bf0db0"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "cccaef00125ac21a261e5b9fd52800a47e72eca5a2be087c3fd8c92ea1da62f7"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "a421ddae0f05544fb63a77bc460c8d9b71fba7499533d7b9c0b6295540f9c785"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d3e128ef5403f15dbd92b933be530877172fabf21469715f3b0c46212dc9e5da"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "dd2769ccdd6df15c46fd40358b15ddeb6ebf378936d4c9fa38f699f35e0007b7"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "e5ff0590a31d593643990f25e6e186d4a53e1dc79c151f3eb8e9b559dac4d4a4"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "07c1193462d01c971a12a849e27c7d8bff8ff87720cca1a5e6e1a13c2d9c0c5e"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "760a84bce5eab60cf7c1e7715d15f088e1619fc99dbb170fa98e91a80c53ce3a"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "4ca8c577ebf5e03aba365f5186e436dbd2bf1cd7cf34ea026e5deeb184a1b689"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "3659f79085e7405ba2cb60634bec7c7e29dde3c2a058d6be613f27d9b9a4d181"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/riscv64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "46bf25a3f80f5247817301fe52b29d0936415311e3d53df8ac4e58e5c4d4f789"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=riscv64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=riscv64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=riscv64 MESON_CPU=riscv64 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="riscv64-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "riscv64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"riscv64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootRiscv64LinuxMusl.stable.url
      sha256 KsysrootRiscv64LinuxMusl.stable.checksum.hexdigest
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
             "--cross-file=riscv64-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
    end
  end
end
