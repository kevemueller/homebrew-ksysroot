class KsysrootX8664Freebsd15AT150FreebsdCurrent < Formula
  desc "Sysroot for x86_64-freebsd15@freebsd15.0-CURRENT"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
  sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "004ad12c0f89bb88a8fa882b0c87799c155cec529b1c799315cc2f7120ec8038"
    sha256 cellar: :any_skip_relocation, ventura:       "60b943bdfc28bfb36b850af355f47a227b62db74ad76ab5495c718e6e38ee340"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "19aa052e25a1ebb6dc23d65c5ba95ad8ca71e65eb723994e5457eab639e60d2f"
  end

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/snapshots/amd64/amd64/15.0-CURRENT/base.txz"
    sha256 "5d9a0fcebba16c22a81310ebb9c2c5ee640f75e9f4207e6d2dc8b28dc075c8eb"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "x86_64-freebsd15@freebsd15.0-CURRENT"
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
