class KsysrootI586LinuxMusl < Formula
  desc "Sysroot for i586-alpine-linux-musl@Alpinev3.21"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
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
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/binutils-2.43.1-r1.apk"
    version "2.43.1-r1-ksr"
    sha256 "452f19e89587545137777218f8d4e78699accb9cfe191f74bae30fe31f216120"
  end

  resource "gcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/gcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "3ac69a1c468ee1ec741b6a1c320d0d9f7dfa18f0328fb3b5114f49c75b074809"
  end

  resource "gmp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/gmp-6.3.0-r2.apk"
    version "6.3.0-r2-ksr"
    sha256 "9c6d6d377ba1f7e3b64e3d8fa86d826ac7ffad8a6d74cbc07cb23873cd608a47"
  end

  resource "isl26" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/isl26-0.26-r1.apk"
    version "0.26-r1-ksr"
    sha256 "cd32b0136e6239fa1c9937e98e2ade03f23f9df0bfb937171a86319a8fe70f08"
  end

  resource "jansson" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/jansson-2.14-r4.apk"
    version "2.14-r4-ksr"
    sha256 "b86c88447dd530aecd7f62a9b5c184efacf4a789ceaa59e38e8b72d6a6ff530d"
  end

  resource "libatomic" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/libatomic-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "579fa2c3dfb79487b5973afc9f38ce8d9531fa24707ad6eb1cbc17c3ff7fb4b7"
  end

  resource "libgcc" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/libgcc-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d555f0da9de4c93fe7080a11c22d1b1e61df72d99a06245da943d09f5e6f81a3"
  end

  resource "libgomp" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/libgomp-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "d10a54b06492ecb6e7bfc9fb7506c115885c88aeda661c9f388dd1a980af0596"
  end

  resource "libstdc++" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/libstdc++-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "42532f90c5004e5d3051a16d370119ff9801a4022ce84d16869ed733cb80b9a5"
  end

  resource "libstdc++-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/libstdc++-dev-14.2.0-r4.apk"
    version "14.2.0-r4-ksr"
    sha256 "7f111b14a8bd204ec423273475c06d88e39389abf58db6459f3d163a645d6152"
  end

  resource "mpc1" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/mpc1-1.3.1-r1.apk"
    version "1.3.1-r1-ksr"
    sha256 "81ae58ea873cb8a5c871f0a9ecc02c15016db08b71a14bccfe3d8118333545e0"
  end

  resource "mpfr4" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/mpfr4-4.2.1-r0.apk"
    version "4.2.1-r0-ksr"
    sha256 "15994cf669ce82a13f4672b4a11c9f4cf0edd5aa3c8b8e2e44204e588f49f7e2"
  end

  resource "musl" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/musl-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "d7255d73ae4ee08c795e437dd000acb31ce347764189e1ad338e3187c72d4b03"
  end

  resource "musl-dev" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/musl-dev-1.2.5-r8.apk"
    version "1.2.5-r8-ksr"
    sha256 "17e25035b57ef1b2de50d42df40b57c90bef6eecd6f38f19c1c3e7599ec0201b"
  end

  resource "zlib" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/zlib-1.3.1-r2.apk"
    version "1.3.1-r2-ksr"
    sha256 "95c66bc1aa87fffc1bbde42dbd723ea6368fefccab90f91ee275d957e6888105"
  end

  resource "zstd-libs" do
    url "http://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86/zstd-libs-1.5.6-r2.apk"
    version "1.5.6-r2-ksr"
    sha256 "bf80f0d2d0e63c78c088b4a172d5838c7de81dedc06f807cd37a21d3c4a7db07"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=i586-alpine-linux-musl KSYSROOT_FULL_TRIPLE=i586-linux6.12-musl
      # KSYSROOT_OSFLAVOUR=Alpine KSYSROOT_OSRELEASE=v3.21
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=MIT
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86 MESON_CPU=i586 MESON_ENDIAN=little
      # ALPINE_BRANCH=v3.21 ALPINE_KERNEL=lts LINUX_VERSION=6.12
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="i586-alpine-linux-musl"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "i586-linux6.12-musl"
    meson_cross.install_symlink meson_cross/"i586-linux6.12-musl" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootI586LinuxMusl.stable.url
      sha256 KsysrootI586LinuxMusl.stable.checksum.hexdigest
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
             "--cross-file=i586-linux6.12-musl", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
