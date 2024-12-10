class KsysrootAarch64Freebsd15AT150FreebsdCurrent < Formula
  desc "Sysroot for aarch64-freebsd15@freebsd15.0-CURRENT"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.3.tar.gz"
  sha256 "04ea37438e9270d235b906954e51a73b7a98400f530bff8f14ccb0601effc237"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  keg_only :versioned_formula

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  resource "base.txz" do
    url "https://download.freebsd.org/snapshots/arm64/aarch64/15.0-CURRENT/base.txz"
    sha256 "5adeb4c56eba659e6f2051784d6f04ffba3d99186b32c0488c49f9f3eb583a0f"
  end

  def install
    ENV["BREW_PREFIX_LLVM"]=Formula["llvm"].prefix
    ENV["BREW_PREFIX_LLD"]=Formula["lld"].prefix
    ENV["BREW_PREFIX_PKGCONF"]=Formula["pkgconf"].prefix
    ENV["BASE_TXZ"]=resource("base.txz").cached_download
    system "./ksysroot.sh", "install", prefix, "aarch64-freebsd15@freebsd15.0-CURRENT"
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
