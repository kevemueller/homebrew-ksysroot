class KsysrootArmv7LinuxMusleabihf < Formula
  desc "Sysroot for armv7-alpine-linux-musleabihf@Alpinev3.21"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "3a711fe4b68f246234c0798dff58d2a8b48ca1fe87b9c33b71a2f65510a8fdc1"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d09053e8b9e0e05af61da8164df6a49e39a1828f6971680eb3e111179022b4e0"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "99f0142bb1bad6582a40165e656bb71e259d7784d6fcf74ceb8499fb71940068"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "255a99cb7000b8f9bedeef26b7e23aa92ccd8f8e585bbce362994d3202232913"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "12c1204c4ad67c4e44f643c21eaa8bd2efc2bba93143171f784188773aa422c2"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "90dd3ae05fad6ed07f0897c630eed49ba51664edb6ca188fce8121ac410704d0"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "a447d262e5a63792e06e66162404c1db9cb12b7ca60eb9d4324cc4309521f67d"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "109f0312a8e8875f779140b0386d49c7037f9fc8ee73e1254f3651d7d6da5ce5"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "941d87e68bff0e08cfd7325e2fcb230db98df832be744bbc7b470043c7cbb270"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "2c467c2af7226d4634bba4d206a9b536627dd9aa3c511b95d3b89f38487d7411"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "aa954da3cec5991ad9aba611b3c1e217a534cf2b3de12b394067184a5c6bcc64"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "a9abca4c36ae46bf4b1555d2ce1352c39d9a685a23dc92ca4f6879d517fe448b"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "cde34ffa5d6efa6cca6e8af34dd88f162bf7afea4b5b01878f7520a08680d992"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "4a203f048f3a9d91469229d37e9b459d8aaf87fb68cbac772f7d2e982163c5f3"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "2a22b7483f29d602c4516cb1e0acd7db800184c0197ed495d96c8cb52700add0"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/armv7/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "e473e4a7013babaf741199eddc64ed1a7a029326445d9bac98d2f0bc68e0f4b3"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=armv7-alpine-linux-musleabihf KSYSROOT_FULL_TRIPLE=armv7-linux6.12-musleabihf
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=arm MESON_CPU=bcm2709 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="armv7-alpine-linux-musleabihf"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "armv7-linux6.12-musleabihf"
    meson_cross.install_symlink meson_cross/"armv7-linux6.12-musleabihf" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootArmv7LinuxMusleabihf.stable.url
      sha256 KsysrootArmv7LinuxMusleabihf.stable.checksum.hexdigest
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
             "--cross-file=armv7-linux6.12-musleabihf", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_path_exists testpath/"build/test-c/main"
      assert_path_exists testpath/"build/test-cxx/main"
    end
  end
end
