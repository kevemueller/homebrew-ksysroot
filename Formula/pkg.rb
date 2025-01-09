class Pkg < Formula
  desc "Package management tool for FreeBSD"
  homepage "https://github.com/freebsd/pkg"
  url "https://github.com/freebsd/pkg.git", using: :git, branch: "main"
  version "1.21.99.6"
  license "BSD-2-Clause"
  head "https://github.com/freebsd/pkg.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "libarchive"
  depends_on "libbsd"
  depends_on "openssl@3"
  uses_from_macos "curl"

  resource "pkgkey" do
    url "https://raw.githubusercontent.com/freebsd/freebsd-src/refs/heads/main/share/keys/pkg/trusted/pkg.freebsd.org.2013102301"
    sha256 "e4ddc1397edacec7951b0d8b1b392dca8a59731942fb488b98cc85cb4b1cd5cd"
  end

  resource "FreeBSD-Latest" do
    url "https://raw.githubusercontent.com/freebsd/freebsd-src/refs/heads/main/usr.sbin/pkg/FreeBSD.conf.latest"
    sha256 "643dcdb6f6ca7e5a9a3dff54d72fa62505a60495c1d75edc673bca90ddd1da20"
  end
  resource "FreeBSD-Quarterly" do
    url "https://raw.githubusercontent.com/freebsd/freebsd-src/refs/heads/main/usr.sbin/pkg/FreeBSD.conf.quarterly"
    sha256 "766fe645e12d29558a9a15325380a40e6c9ccf1e08968a45da5020c8989afbd2"
  end

  patch :p0, :DATA

  def install
    system "set"
    system "./configure", "--with-libarchive.pc", "--with-libcurl", "--with-openssl.pc", "--disable-silent-rules",
      *std_configure_args
    system "make"
    system "make", "install"
    bin.install "pkg.sh" => "pkg"

    sharepkg=share/"keys/pkg"

    mkdir sharepkg/"revoked"
    File.write(sharepkg/"revoked/.empty", "")
    mkdir sharepkg/"trusted"
    (sharepkg/"trusted").install resource("pkgkey").cached_download => "pkg.freebsd.org.2013102301"

    etcrepos=prefix/"etc/pkg/repos"
    etcrepos.install resource("FreeBSD-Quarterly").cached_download => "FreeBSD-Quarterly.conf"
    inreplace etcrepos/"FreeBSD-Quarterly.conf", "FreeBSD:", "FreeBSD-Quarterly:"
    etcrepos.install resource("FreeBSD-Latest").cached_download => "FreeBSD-Latest.conf"
    inreplace etcrepos/"FreeBSD-Latest.conf", "FreeBSD:", "FreeBSD-Latest:"

    base = <<~EOS
      FreeBSDbase-Latest: {
        url: "pkg+https://pkg.FreeBSD.org/${ABI}/base_latest",
        mirror_type: "srv",
        signature_type: "fingerprints",
        fingerprints: "/usr/share/keys/pkg",
        enabled: yes
      }
    EOS
    File.write(etcrepos/"FreeBSDbase-Latest.conf", base)
  end

  def caveats
    <<~EOS
      #{name} is intended to manage packages natively on FreeBSD systems, running as root.
      As an administrative tool it was installed under
        #{sbin}/#{name}
      and is not generally available on the $PATH.

      This version of #{name} has experimental wrapper installed under
        #{bin}/#{name}
      which caters for setting up running #{name} in a non-native environment.
      It will ensure proper options to #{name} as well as a proper root-directory to operate in.
      It will by default log file metadate in a LOG.mtree file in the root-directory.
      A set of configuration files was added, that are otherwise provided by FreeBSD base.

      The user is still required to set
        -o ABI=FreeBSD:<version>:<arch> -o OSVERSION=<version>0000
      in order to point at the right pkg repository.
      As this version ships with multiple enabled repositories, it is recommended to select one
      on the command-line:
        {update|install} -r {FreeBSD-Latest|FreeBSD-Quarterly|FreeBSDbase-Latest}.

      Feedback is welcome at https://github.com/kevemueller/homebrew-ksysroot.

      This is not an official build of pkg.
    EOS
  end

  test do
    system sbin/"pkg", "-vv"
  end
end
__END__
--- /dev/null	2025-01-09 11:31:44
+++ pkg.sh	2025-01-09 11:31:41
@@ -0,0 +1,51 @@
+#!/bin/sh
+set -e
+
+pkg_prefix="$(dirname "$(realpath "$(command -v "$0")")")"/..
+
+grab_pkgroot() {
+  while getopts 'vdlN46o:j:c:r:C:R:' opt; do
+    case "${opt}" in
+      r)
+        pkg_rootdir="${OPTARG}"
+        ;;
+      v)
+        pkg_needroot="no"
+        ;;
+      d | l | N | 4 | 6)
+        # echo no param option "${opt}"
+        ;;
+      o | j | c | C | R)
+        # echo option "${opt}" - "${OPTARG}"
+        ;;
+      *)
+        1>&1 echo Unrecognized "${opt}"
+        ;;
+    esac
+  done
+  shift $((OPTIND - 1))
+  pkg_command="$1"
+  case "${pkg_command}" in
+    repo | conf) ;;
+    *)
+      : "${pkg_needroot:=yes}"
+      ;;
+  esac
+}
+
+grab_pkgroot "$@"
+if [ "${pkg_needroot}" = "yes" ]; then
+  if [ -z "${pkg_rootdir}" ]; then
+    pkg_rootdir="$(mktemp -dt pkg)"
+    1>&2 echo No root directory specified, will work in temporary directory "${pkg_rootdir}"
+    set -- -r "${pkg_rootdir}" "$@"
+  fi
+  pkg_keys="${pkg_rootdir}/usr/share/keys/pkg"
+  mkdir -p "${pkg_keys}"
+  if [ ! -d "${pkg_keys}"/trusted ]; then
+    1>&2 echo Initializing default keys in "${pkg_keys}"
+    cp -a "${pkg_prefix}"/share/keys/pkg/* "${pkg_keys}"
+  fi
+fi
+
+exec env INSTALL_AS_USER=yes /usr/local/sbin/pkg -o IGNORE_OSVERSION=yes -o RUN_SCRIPTS=no -o METALOG=LOG.mtree "$@"
