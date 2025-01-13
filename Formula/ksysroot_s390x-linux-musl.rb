class KsysrootS390xLinuxMusl < Formula
  desc "Sysroot for s390x-alpine-linux-musl@Alpinev3.21"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "MIT"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "026ff06a97371e2fc4bb9b91bc4c81edc9e3eaba9f1b82940e3519c4629fa00e"
    sha256 cellar: :any_skip_relocation, ventura:       "c0ac8256d0db156696253683d91525b013af8ea89f3eeb0419c3e599bfbbeed6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "60b121c7121f3caed78bbfba681a915438999072ee2c5ee94e435a45a7f14ace"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "be8ae9f9cd197934d4486279b61c1f805befc5b83bc1fc4dad42277cc1ee4a69"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "270b5832f829fdaecaddbf4067e112c38dfc18a2415c1cca779e432611648f79"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "e58bd44e0c22ab1b6016171885ff101715ae3aafcb0f40b355dfb5a09a428113"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "1c104608ad4eb4b36667f0351c2a1b05d747a229513ea83667b6618d96c3c464"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "b94675c4553368319a015ed8ee775b88bdbb2ec13fa86a647730d78e4ef7f264"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "dfd38a61944ab6796d4decb35ebc9167ae05c22449fa627efe0041f7688ab8b9"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "89a6ea3308490b5ec2994d6a772f7e4cbbd16622d368e338f0ab4b42af15d316"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "ee9994ed1ac7612464934a10c3186d8bb7f97fcac50baf149abaeecefe65c2a5"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "a5a19f810caa5d0bc5cac3f7bbecf0017cf67cae2871d216eba60245225dfc42"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "dcbbbd948fcb92a0dcdea7df447985620a4b4c2d3d68104467d4095cd28072fa"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "48b2cbee22a28e8c30a50c1137a2984e9fec5201ea96a00af5a2d78a0b4aff08"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "dbfa6d3a0bd96f935788f82a874981e1dab33d5c2a1065bed93b44d3b38b0d6b"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "65375d35de9e9981a4fad1a1bfecec3499b58021c322a0d8d47da0c28f407a2a"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "045f64742202db5f3e081110c905ac67dbae8928e44d88233fdcf539c4176fa7"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "edf1cb5c462b8c883e01f807bba9138c46a42a5a0574a3b991f7312c4eea2ccb"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/s390x/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "1105f1d463c7a97c2e482c866cfa541a3a7b048668050f30a96c2d56262bf988"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=s390x-alpine-linux-musl KSYSROOT_FULL_TRIPLE=s390x-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=s390x MESON_CPU=s390x MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="s390x-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "s390x-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"s390x-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootS390xLinuxMusl.stable.url
      sha256 KsysrootS390xLinuxMusl.stable.checksum.hexdigest
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
             "--cross-file=s390x-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
