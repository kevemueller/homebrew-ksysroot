class KsysrootAarch64Linux612MuslAT99edgeAlpine < Formula
  desc "Sysroot for aarch64-alpine-linux-musl@Alpine99edge"
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
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "584ff4d2c7efe63ccdc92f818c06cfe1407d6ee2fa04d034947db85d0c35e454"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/gcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "129ca949dc03412de7e9cd7cf6ef03585c2094b76b06c6f1a6d81adfa89f7dad"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "1f81b65d3142799b81efa9f7a1afb5acb2085d7614b9c11faba1eaa91bcba420"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "e847f39b631be52ccffa4d45f54d8e394a155f2190082028416cee324cd9a851"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "d06ddfbd88078acc41b1e33c05ede1a19d3648bb14d7817558516be2e7bc3ee3"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/libatomic-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "182c940076801dbd59ad7a000b74e28771c97c5f67d5efcff4d3207741262020"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/libgcc-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "55eabef1f24002ac614565e861e0b23fdd80dd388f094adb91c26fc4c6c8f63d"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/libgomp-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "fff1cc85846b189c8996cfbe13c40f2e4b7fd363f3593a37be5c2e1d3deae294"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/libstdc++-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "b78fdbea80ad8926736586d2fe0b789f168dd152ba333b48eb17ed5b62ae497c"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/libstdc++-dev-14.2.0-r5.apk"
    version "14.2.0-r5-ksr"
    sha256 "2a08cec6188dccb80b74c4816ce9edffd3adc4f89490a731a5a733b447c7f03b"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "276bb5e3b0e08bd4ac54c7aa1572b29cac6364409d58b2dd9c2b8a7079f1f651"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "34bffff8a9a64d147aee4eeb56a9caeacd7dfc270fce1f5f4ab7f5b7eeede154"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/musl-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "a320ad07c61847da0bb4bc161b42f6496d1d5e9c788541f9a7751af22cbb7253"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/musl-dev-1.2.5-r9.apk"
    version "1.2.5-r9-ksr"
    sha256 "c2fd53a13d7105f5332707d96cbecb6caa9577c4c2fa8088413a8f0b79216c9d"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "d977110f90f6d631508a9ccd173123a19294097d72928947a0ee94f0d2c0889b"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/edge/main/aarch64/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "6da7759d1a228dec9aab571d69d07e4a19c433c9ee4513612fbcfb72c8c7db64"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-alpine-linux-musl KSYSROOT_FULL_TRIPLE=aarch64-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=edge
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
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
    meson_cross.install prefix/"cross.txt" => "aarch64-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"aarch64-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootAarch64Linux612MuslAT99edgeAlpine.stable.url
      sha256 KsysrootAarch64Linux612MuslAT99edgeAlpine.stable.checksum.hexdigest
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
             "--cross-file=aarch64-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
    end
  end
end
