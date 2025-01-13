class KsysrootAarch64Netbsd < Formula
  desc "Sysroot for aarch64-netbsd10.1@NetBSD10.1"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "BSD-4-Clause-UC"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "365d3761bfecc0c5cb00eb2a09b7fc3e1ff6db774f4488dcc5c9218ab80a9dc7"
    sha256 cellar: :any_skip_relocation, ventura:       "1617ecfc312417c8f3699d3f5b7a63a60451ff75b189a3c6fae45c96ee5123f6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "72070389aeecbf9b31a00ed4b6e82f34ecbf0571e373b1d263063f379eba12a2"
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

  resource "base.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/evbarm-aarch64/binary/sets/base.tar.xz"
    version "10.1-ksr"
    sha256 "8ad3350f88ab49f3f9da568e8d42abf61d51079e5797efc267739d6c810ad985"
  end

  resource "comp.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/evbarm-aarch64/binary/sets/comp.tar.xz"
    version "10.1-ksr"
    sha256 "5528dccd83ffcd47ad0078dc3d980f6451f2a91c4361525103d387d17c46b6a4"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-netbsd10.1 KSYSROOT_FULL_TRIPLE=aarch64-netbsd10.1
      # KSYSROOT_OSFLAVOUR=NetBSD KSYSROOT_OSRELEASE=10.1
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-4-Clause-UC
      # MESON_SYSTEM=netbsd MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # NETBSD_VERSION=10.1 NETBSD_KERNEL=10.1 NETBSD_PORT=evbarm-aarch64
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="aarch64-netbsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "aarch64-netbsd10.1"
    meson_cross.install_symlink meson_cross/"aarch64-netbsd10.1" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootAarch64Netbsd.stable.url
      sha256 KsysrootAarch64Netbsd.stable.checksum.hexdigest
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
             "--cross-file=aarch64-netbsd10.1", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
