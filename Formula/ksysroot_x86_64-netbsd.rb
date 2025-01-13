class KsysrootX8664Netbsd < Formula
  desc "Sysroot for x86_64-netbsd10.1@NetBSD10.1"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "BSD-4-Clause-UC"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9dde9e19061faad53f55c02a53ed163b955476def866d45b620aa0da36d3ea19"
    sha256 cellar: :any_skip_relocation, ventura:       "f1f28dc0d0337f3293514da6ed0f001096c060ac0f7eacbbd61cf9a01306e804"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "base.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/amd64/binary/sets/base.tar.xz"
    version "10.1-ksr"
    sha256 "ec59d1198dad7de81771bfb93f50425241bc51331b4c50ba7a163ca4d6acd427"
  end

  resource "comp.tar.xz" do
    url "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/amd64/binary/sets/comp.tar.xz"
    version "10.1-ksr"
    sha256 "02e51e63e05b54f9d30d4d566c55e96e1b8b36fb8e870b1cc3ed9494d93d11f3"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-netbsd10.1 KSYSROOT_FULL_TRIPLE=x86_64-netbsd10.1
      # KSYSROOT_OSFLAVOUR=NetBSD KSYSROOT_OSRELEASE=10.1
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-4-Clause-UC
      # MESON_SYSTEM=netbsd MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # NETBSD_VERSION=10.1 NETBSD_KERNEL=10.1 NETBSD_PORT=amd64
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="x86_64-netbsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "x86_64-netbsd10.1"
    meson_cross.install_symlink meson_cross/"x86_64-netbsd10.1" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootX8664Netbsd.stable.url
      sha256 KsysrootX8664Netbsd.stable.checksum.hexdigest
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
             "--cross-file=x86_64-netbsd10.1", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
    end
  end
end
