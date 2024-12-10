class KsysrootAarch64Freebsd13AT133FreebsdRelease < Formula
  desc "Sysroot for aarch64-freebsd13@freebsd13.3-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.3.tar.gz"
  sha256 "04ea37438e9270d235b906954e51a73b7a98400f530bff8f14ccb0601effc237"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3d33aac64b1de15e09ddb35b57d1e3d60cef756abaf5da2432324774edb6c2ee"
    sha256 cellar: :any_skip_relocation, ventura:       "d2692e686c3f3e9c836f12b2f153e672dc107f5306e0f83aa744907c9b3ada88"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ba210f145cebcd7baf630bcceaa244dc6ffbc9193f6a23fc8ac19db2d441a1f8"
  end

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/arm64/aarch64/13.3-RELEASE/base.txz"
    sha256 "1eaa8a0e0d932f9b8f5087e2cf91d7d49ad1c7a303048b8363fa8e67644d3fec"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "aarch64-freebsd13@freebsd13.3-RELEASE"
  end

  test do
    resource "testcases" do
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.3.tar.gz"
      sha256 "04ea37438e9270d235b906954e51a73b7a98400f530bff8f14ccb0601effc237"
    end
    resource("testcases").stage do
      with_env(
        "CC"          => "",
        "CXX"         => "",
        "OBJC"        => "",
        "OBJCXX"      => "",
        "CFLAGS"      => "",
        "CPPFLAGS"    => "",
        "CXXFLAGS"    => "",
        "LDFLAGS"     => "",
        "OBJCFLAGS"   => "",
        "OBJCXXFLAGS" => "",
        "CPATH"       => "",
      ) do
        system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
          "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
        system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
        assert_predicate testpath/"build-c/main", :exist?
      end
    end
  end
end
