class KsysrootNative < Formula
  desc "Sysroot for native@macos15.2"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license ""
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e36f50a54ef347df2f183059e28383fc51cb5c4f6d6f126a570816394417db85"
    sha256 cellar: :any_skip_relocation, ventura:       "e77c3c4e5371f89a9f435fb009e4c1a04fbb553f6b7b9bcb488d96e47f6193cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ed3e951583421c30e83a108dc23d97c92fb045fbb722a872fe00b67401059472"
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
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check that pkg-config runs
      system "#{bin}/native-pkg-config", "--list-all"
    end
  end
end
