class KsysrootX8664Freebsd14AT141FreebsdRelease < Formula
  desc "Sysroot for x86_64-freebsd14@freebsd14.1-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
  sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "03a619020570ef6e9ce34f234b5a7b2dd977084857f9c32a524713f9b2811bf3"
    sha256 cellar: :any_skip_relocation, ventura:       "a9e4693e3cf24600864fc4512a5b94398e26bf7627e942f037920ffc684b63e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6a4a20c036d30b3d62b5cd19570b983beefe4f6a7515c99bbf864c9428c61016"
  end

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/amd64/amd64/14.1-RELEASE/base.txz"
    sha256 "bb451694e8435e646b5ff7ddc5e94d5c6c9649f125837a34b2a2dd419732f347"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "x86_64-freebsd14@freebsd14.1-RELEASE"
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
