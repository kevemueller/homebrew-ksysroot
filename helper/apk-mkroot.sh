#!/bin/sh
set -e

usage() {
  echo "Usage:"
  echo "  $0 <apk-root-directory> [<Alpine version:-3.21>] [<Alpine architecture:-aarch64>]"
}

if [ $# -lt 1 ]
then
  usage
  exit 1
fi

APK_ROOT="$1"
ALPINE_VERSION="${2:-3.21}"
ALPINE_ARCH="${3:-aarch64}"

for i in lib/apk/db lib/apk/exec var/log var/cache etc
do
  mkdir -p "${APK_ROOT}/${i}"
done

cp -aL /usr/local/etc/apk "${APK_ROOT}"/etc

touch "${APK_ROOT}"/etc/apk/world
echo "${ALPINE_ARCH}" >"${APK_ROOT}"/etc/apk/arch

cat >"${APK_ROOT}"/etc/apk/repositories <<EOF
http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main
http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community
EOF
