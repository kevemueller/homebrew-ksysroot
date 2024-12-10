class KsysrootX8664Freebsd13AT133FreebsdRelease < Formula
  desc "Sysroot for x86_64-freebsd13@freebsd13.3-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.2.tar.gz"
  sha256 "c3b16ca49dc38e2d72d67cf71b6d153048428aed250b263f372c91289834789a"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "492796477fcdcab0866a590e3719e6dd4b0d1bce8d4996b6af8a3ea08732dc9b"
    sha256 cellar: :any_skip_relocation, ventura:       "677eee2ee2ec4bc81bb3b720f2dbea38c0c46e56f7ebeb1d2f53c0c57c4c4dca"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ecc113814c90d83e285482f477b08c8b8eb7a42fe8fc1bdeec0b8ce9133e799e"
  end

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/releases/amd64/amd64/13.3-RELEASE/base.txz"
    sha256 "d10531d663cee5efeb7d696ca84ce90adacd1fae14dd249628fb74da0c7c2820"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "x86_64-freebsd13@freebsd13.3-RELEASE"
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
