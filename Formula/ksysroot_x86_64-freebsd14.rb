class KsysrootX8664Freebsd14 < Formula
  desc "Sysroot for x86_64-freebsd14@freebsd14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
  sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "45f024e4d75190848bdf19d573999e0e10abe9d46576650adf4195dd9952513b"
    sha256 cellar: :any_skip_relocation, ventura:       "8b85560edda38ebe9d3c110227c009a9e35f8005382bde3502cd1c7d954ce860"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "99c449f0fcc922f3d2f91bc9d751bc3c88bd76d26a9fd9791e1446d172babf8f"
  end

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/amd64/amd64/14.2-RELEASE/base.txz"
    sha256 "e3971a3d4f36ed1ac67d2e7a5501726de79dd3695aa76bfad2a4ebe91a88a134"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "x86_64-freebsd14@freebsd14.2-RELEASE"
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
