class Kyua < Formula
  desc "Testing framework for infrastructure software (staged)"
  homepage "https://github.com/freebsd/kyua"
  #  url "https://github.com/freebsd/kyua/releases/download/kyua-0.14/kyua-0.14.tar.gz"
  url "https://github.com/freebsd/kyua.git", tag: "kyua-0.14"
  license "BSD-3-Clause"
  head "https://github.com/freebsd/kyua.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    rebuild 1
    sha256 arm64_sequoia: "b5bfc1bf190186b9130cd9bae15e67d5afc1dd39d0fca5379ee8a212d0ffe45a"
    sha256 ventura:       "f52092e829ae14b2971a3c32d8db469c1f807a140872346bf79e1b5c6d7f6f44"
    sha256 x86_64_linux:  "32e213f817bf7431ee88ca51d26bea866e24a92e72f253180f72981990520013"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "atf"
  depends_on "lua"
  depends_on "lutok"
  depends_on "sqlite"

  def install
    system "autoreconf", "-i", "-s"
    system "./configure", "--enable-atf", "--disable-developer", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end

  test do
    assert_match "0.14", shell_output("#{bin}/kyua about")
  end
end
