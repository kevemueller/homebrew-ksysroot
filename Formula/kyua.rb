class Kyua < Formula
  desc "Testing framework for infrastructure software"
  homepage "https://github.com/freebsd/kyua"
  #  url "https://github.com/freebsd/kyua/releases/download/kyua-0.14/kyua-0.14.tar.gz"
  url "https://github.com/freebsd/kyua.git", tag: "kyua-0.14"
  license "BSD-3-Clause"
  head "https://github.com/freebsd/kyua.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "atf"
  depends_on "lua"
  depends_on "lutok"
  depends_on "sqlite"

  def install
    # ENV.append "CPPFLAGS", "-I#{Formula["lua"].opt_include}/lua"

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
