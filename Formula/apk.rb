class Apk < Formula
  desc "Alpine package manager"
  homepage "https://gitlab.alpinelinux.org/alpine/apk-tools"
  # not yet Mesonified
  # url "https://gitlab.alpinelinux.org/alpine/apk-tools/-/archive/v2.14.7/apk-tools-v2.14.7.tar.bz2"
  # sha256 "92d7607f1a5c2023d50ba88c8e8ee7ccd044b2ce967aec76b4732278258524a2"
  url "https://gitlab.alpinelinux.org/alpine/apk-tools.git", branch: "master"
  version "2.9.99"
  license "GPL-2.0-or-later"
  revision 1
  head "https://gitlab.alpinelinux.org/alpine/apk-tools.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any, arm64_sequoia: "b8b1599be6dbbdcb97a7bf0bae597e4d308f7e2e05e3ac990c534c3827ce4d51"
    sha256 cellar: :any, ventura:       "ed115a203e740819f03fdbdd1b1d8481b290ffa5a620ee629dcf7106c4303179"
    sha256               x86_64_linux:  "20c68999fe553f83f57901cf46b18658b708ec99b444beccd7baef43fe3587d1"
  end

  depends_on "cmocka" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "scdoc" => :build
  depends_on "lua"
  depends_on "openssl@3"
  depends_on "python"
  depends_on "zstd"
  uses_from_macos "zlib"

  patch :p1, :DATA

  # TODO: add lua-zlib (https://github.com/brimworks/lua-zlib)
  def install
    File.write("VERSION", "2.9.99")
    system "meson", "setup", "-Dlua_version=5.4", "-Dcompressed-help=false", "-Darch=aarch64",
           *std_meson_args, "builddir"
    system "meson", "compile", "-C", "builddir"
    system "meson", "install", "-C", "builddir"
    bin.install "apk-mkroot.sh" => "apk-mkroot"
  end

  def caveats
    <<~EOS
      #{name} must be run with a dedicated --root prefix, otherwise it will assume / as root.
        #{name} --root my-apk-root
        #{name} -p my-apk-root

      The root must have certain directories and files already pre-populated for #{name} to work.
      This version includes a simple helper apk-mkroot that creates a suitable directory structure
      for #{name} to run.
        apk-mkroot -r v3.21 -a armv7 my-apk-root-directory [my-additional-initial-contraints...]
    EOS
  end

  test do
    system bin/"apk", "--version"
  end
end
__END__
--- /dev/null	2025-01-11 21:36:59
+++ ./apk-mkroot.sh	2025-01-11 21:34:09
@@ -0,0 +1,61 @@
+#!/bin/sh
+set -e
+
+: "${ALPINE_BRANCH:=v3.21}"
+: "${ALPINE_ARCH:=$(apk --print-arch)}"
+
+usage() {
+  echo "Usage:"
+  echo "  $0 [-r <branch>] [-a <architecture>] <apk-root-dir> [...]"
+  echo "Where:"
+  echo "  branch        is the Alpine branch to use, defaults to ${ALPINE_BRANCH}"
+  echo "  architecture  is the Alpine architecture to use, defaults to ${ALPINE_ARCH}"
+  echo "  apk-root-dir  is the root directory to initialize"
+  echo "  ...           are additional CONSTRAINTS to ensure"
+  echo "Environment:"
+  echo "  ALPINE_BRANCH use this branch as the default"
+  echo "  ALPINE_ARCH   use this arch as the default"
+}
+
+if [ $# -lt 1 ]
+then
+  usage
+  exit 2
+fi
+
+while getopts 'r:a:' opt
+do
+  case "${opt}" in
+    r)
+      ALPINE_BRANCH="${OPTARG}"
+      ;;
+    a)
+      ALPINE_ARCH="${OPTARG}"
+      ;;
+    *)
+      1>&1 echo Unrecognized option "${opt}"
+      usage
+      exit 2
+      ;;
+  esac
+done
+shift $((OPTIND - 1))
+APK_ROOT="$1"
+shift
+
+# bootstrap alpine-keys untrusted from https
+apk --root "${APK_ROOT}" --arch "${ALPINE_ARCH}" \
+  --repository "https://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/main" \
+  --allow-untrusted --update-cache --no-interactive \
+  add --initdb --usermode --no-scripts \
+  alpine-keys
+
+# set standard repositories
+cat >"${APK_ROOT}"/etc/apk/repositories <<EOF
+http://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/main
+# http://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/community
+EOF
+
+# ensure we re-create the index with verification, potentially adding more constraints
+apk --root "${APK_ROOT}" --update-cache \
+  add --usermode --no-scripts "$@"
