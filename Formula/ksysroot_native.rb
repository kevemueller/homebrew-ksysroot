class KsysrootNative < Formula
  desc "Sysroot for native@macos15.2"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "023d15752c0908cabd9630b5356ec7d49f5890a5b5411157c4114c3b866cec7c"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bf56aaea817eaa9d08e3b7f7d9ae83e93abd7289d7aa2393101665f24bc03066"
    sha256 cellar: :any_skip_relocation, ventura:       "bcb70bf39a368c4732931a082bce1a870345521cbf54128be4b96aa9fd5b9f5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "558a63eb154a8bdc4b27130d6b4e79ed0f69d68c357a75a62bf5b95d2f07d193"
  end

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    system "./ksysroot.sh", "install", "native", prefix
    mkdir "#{share}/meson/native"
    share.install "#{prefix}/native.txt" => "meson/native/ksysroot"
  end
  test do
    resource "testcases" do
      url KsysrootNative.stable.url
      sha256 KsysrootNative.stable.checksum.hexdigest
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
      # build a C library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check that pkg-config runs
      system "#{bin}/native-pkg-config", "--list-all"
    end
  end
end
