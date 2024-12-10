class KsysrootX8664Freebsd14AT142FreebsdStable < Formula
  desc "Sysroot for x86_64-freebsd14@freebsd14.2-STABLE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
  sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b7df0980b5bd73ae57d3c3ab4aa914ae8f4bc15c42241775b474100679e683c"
    sha256 cellar: :any_skip_relocation, ventura:       "3ad3099bb256d4307ca9baabfc936cc766651bb73697aa3e648fcca664386293"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7429af9d980b5475a89e6ba1bacae5c619c9a26df8cd637e5764ae597b125c00"
  end

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/snapshots/amd64/14.2-STABLE/base.txz"
    sha256 "3461faf670f0e8c06fe72eb5b3725247f270e819d5ae190b54f21e65ed8f2fbe"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "x86_64-freebsd14@freebsd14.2-STABLE"
  end

  test do
    resource "testcases" do
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
      sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
    end
    resource("testcases").stage do
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
        "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?
    end
  end
end
