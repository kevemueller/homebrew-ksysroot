class ApkDownloadStrategy < CurlDownloadStrategy
  def stage(&block)
    UnpackStrategy::Tar.new(cached_location)
                       .extract_nestedly(basename:,
                                         verbose:  verbose? && !quiet?)
    chdir(&block) if block
  end
end

class Apk < Formula
  desc "Alpine package manager"
  homepage "https://gitlab.alpinelinux.org/alpine/apk-tools"
  # not yet Mesonified
  # url "https://gitlab.alpinelinux.org/alpine/apk-tools/-/archive/v2.14.7/apk-tools-v2.14.7.tar.bz2"
  # sha256 "92d7607f1a5c2023d50ba88c8e8ee7ccd044b2ce967aec76b4732278258524a2"
  url "https://gitlab.alpinelinux.org/alpine/apk-tools.git", branch: "master"
  version "2.9.99"
  license "GPL-2.0-or-later"
  head "https://gitlab.alpinelinux.org/alpine/apk-tools.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any, arm64_sequoia: "f085aff41ecff06533d8061bee4e20a41098a72562a28a72ea34f6c9e2313751"
    sha256 cellar: :any, ventura:       "d44b3f56213623c1f9675dc76186ce1127d598bc7a15315f87a7572bfa697d5a"
    sha256               x86_64_linux:  "ecab2884c504ce2b545ffb8469eb43b62e135723a8a8ddc2cfe5943fe2eedf1b"
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

  resource "alpine-keys" do
    url "https://dl-cdn.alpinelinux.org/alpine/v3.21/main/aarch64/alpine-keys-2.5-r0.apk", using: ApkDownloadStrategy
    sha256 "a70d3c55ee676d7d670714aa729285d5ab6fcf18146eb03e05319098bcb715c0"
  end

  patch :p1, :DATA

  # TODO: add lua-zlib (https://github.com/brimworks/lua-zlib)
  # set arbitrary arch

  def install
    File.write("VERSION", "2.9.99")
    system "meson", "setup", "-Dlua_version=5.4", "-Dcompressed-help=false", "-Darch=aarch64",
           *std_meson_args, "builddir"
    system "meson", "compile", "-C", "builddir"
    system "meson", "install", "-C", "builddir"
    apk_keys=prefix/"etc/apk/keys"
    resource("alpine-keys").stage do
      apk_keys.install Dir["usr/share/apk/keys/*.pub"]
    end
    bin.install "apk-mkroot.sh" => "apk-mkroot"
  end

  def caveats
    <<~EOS
      #{name} must be run with a dedicated --root prefix, otherwise it will assume / as root.
        #{name} --root my-apk-root
        #{name} -p my-apk-root

      The root must have certain directories and files already pre-populated for #{name} to work.
      This version includes a simple wrapper apk-mkroot that creates a suitable directory structure
      for #{name} to run.
        apk-mkroot <my-apk-root-directory> [<alpine-version:-3.21>] [<alpine-arch:-aarch64>]
    EOS
  end

  test do
    system bin/"apk", "--version"
  end
end
__END__
--- /dev/null	2025-01-10 14:52:11
+++ ./apk-mkroot.sh	2025-01-10 14:51:38
@@ -0,0 +1,32 @@
+#!/bin/sh
+set -e
+
+usage() {
+  echo "Usage:"
+  echo "  $0 <apk-root-directory> [<Alpine version:-3.21>] [<Alpine architecture:-aarch64>]"
+}
+
+if [ $# -lt 1 ]
+then
+  usage
+  exit 1
+fi
+
+APK_ROOT="$1"
+ALPINE_VERSION="${2:-3.21}"
+ALPINE_ARCH="${3:-aarch64}"
+
+for i in lib/apk/db lib/apk/exec var/log var/cache etc
+do
+  mkdir -p "${APK_ROOT}/${i}"
+done
+
+cp -aL /usr/local/etc/apk "${APK_ROOT}"/etc
+
+touch "${APK_ROOT}"/etc/apk/world
+echo "${ALPINE_ARCH}" >"${APK_ROOT}"/etc/apk/arch
+
+cat >"${APK_ROOT}"/etc/apk/repositories <<EOF
+http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main
+http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community
+EOF
