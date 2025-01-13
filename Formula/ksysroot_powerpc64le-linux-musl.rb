class KsysrootPowerpc64leLinuxMusl < Formula
  desc "Sysroot for powerpc64le-alpine-linux-musl@Alpinev3.21"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "MIT"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "86e1a9273d395bb653da58c9646be3c8c6d9cff00019e590cc8ec4a3ccd2efb4"
    sha256 cellar: :any_skip_relocation, ventura:       "e8aae33e94214b380ce79fa86f1c1be280f143ba23ee83975452f731ca1bdcb2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9aebac2fd4b932cdc9ecd5bf77afc5025cc7209d418c340ecd30eadf9be2c5cf"
  end

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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "6800e95625650b91454f31c42fa28ad873df64de0da5bae52cd34cbd5b691c8b"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "b7b50e1c5f587e215bea89acf1923c0e1891cc7c034891dc9589487c4e84d3ca"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "b7e7d503851d2c35358022b2641765873b3812a99ef6f16d007d6462e3475c93"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "d18f53929dfdfba8a9179242fd52cd2191fe01e844c6672451bed2c66a93bd53"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "8d114e566405395bc4e05be5f9938baedbcdd7f287ef3c7d26d2184d8cba155d"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "a9c9372d255194ee5d2065c11d323487b88d6d44db8612f628af7dd2fa4a3b1f"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "39a6c4f15551ab5f6d543c0c3e5cd5b4a207179dc6423e2fa9abbf45a933f92f"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "6ba8f0a4e1acb7cebcbc0646d43d6456977964f0803344dd957a01747e01a3e3"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "8cab3f3aafa2e5d8351a90e49cb1e8a0f7325f847a1560c2bc102ffaf1723bb1"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "4ca16c5cdf67de364c7e42cee7fa81cedb4db214e68dd08d79690b845d05c9de"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "0c8640f522a9764939055ecb36cfeb43e8a162eab896a54922e56fc4d5cf59d0"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "2d70e676900756cbd2844b9c7e40426788fa3ae973b3a1f2cbad241f1dea1f47"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "d1675e41966f14c655c81c5e6991262671f57b33f552b923abb458bdbc96228f"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "681dec54484bcf481861a8a93a9c53a7e79484fdd76e92408bc954a157acdd21"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "dd2503542a8f3e4dc60bef6a4cb74b414e58186cf4a1a006d0f723fc53889e66"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/ppc64le/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "6b60d0cdd1292b4e84007d31d2c6b473e8f2b18f1a47f55263dff53e3c358e59"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-alpine-linux-musl KSYSROOT_FULL_TRIPLE=powerpc64le-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=ppc64 MESON_CPU=power8 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="powerpc64le-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "powerpc64le-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"powerpc64le-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootPowerpc64leLinuxMusl.stable.url
      sha256 KsysrootPowerpc64leLinuxMusl.stable.checksum.hexdigest
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
             "--cross-file=powerpc64le-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
