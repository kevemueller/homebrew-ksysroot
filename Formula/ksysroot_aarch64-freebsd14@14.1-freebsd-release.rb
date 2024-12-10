class KsysrootAarch64Freebsd14AT141FreebsdRelease < Formula
  desc "Sysroot for aarch64-freebsd14@freebsd14.1-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.3.tar.gz"
  sha256 "04ea37438e9270d235b906954e51a73b7a98400f530bff8f14ccb0601effc237"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0b47b2cc52127340a18bd481425163ca90a5327c55511c3e37ade5740dfa01c2"
    sha256 cellar: :any_skip_relocation, ventura:       "a5bd6daef1abe8ebcc3439b45076403c4ec0e04439df36efa5a7a0474dbc0340"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "327dfb4a274f84371bd22d9749f386a2f7d54dfe2c458ff43646ee6b2505d1ea"
  end

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/arm64/aarch64/14.1-RELEASE/base.txz"
    sha256 "b25830252e0dce0161004a5b69a159cbbd92d5e92ae362b06158dbb3f2568d32"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "aarch64-freebsd14@freebsd14.1-RELEASE"
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
