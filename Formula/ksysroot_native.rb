class KsysrootNative < Formula
  desc "Sysroot for native@macos15.2"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d139f3e6b94b84c64c7604561f29c5a1871be087613c78eb8c8796fc95a84ee1"
    sha256 cellar: :any_skip_relocation, ventura:       "f7e361dcdf23467b76cf40ff006b0703d33e6f4c60770b5289efdadd9dc3564a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "25fabb8b5a624f93ff1c0e47c071f553ef351df3f8a7d0ec1cf0a34e277d7cf2"
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
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
      sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
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
      # build a C library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      system "#{bin}/native-pkg-config", "--list-all"
    end
  end
end
