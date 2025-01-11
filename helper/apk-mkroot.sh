#!/bin/sh
set -e

: "${ALPINE_BRANCH:=v3.21}"
: "${ALPINE_ARCH:=$(apk --print-arch)}"

usage() {
  echo "Usage:"
  echo "  $0 [-r <branch>] [-a <architecture>] <apk-root-dir> [...]"
  echo "Where:"
  echo "  branch        is the Alpine branch to use, defaults to ${ALPINE_BRANCH}"
  echo "  architecture  is the Alpine architecture to use, defaults to ${ALPINE_ARCH}"
  echo "  apk-root-dir  is the root directory to initialize"
  echo "  ...           are additional CONSTRAINTS to ensure"
  echo "Environment:"
  echo "  ALPINE_BRANCH use this branch as the default"
  echo "  ALPINE_ARCH   use this arch as the default"
}

if [ $# -lt 1 ]
then
  usage
  exit 2
fi

while getopts 'r:a:' opt
do
  case "${opt}" in
    r)
      ALPINE_BRANCH="${OPTARG}"
      ;;
    a)
      ALPINE_ARCH="${OPTARG}"
      ;;
    *)
      1>&1 echo Unrecognized option "${opt}"
      usage
      exit 2
      ;;
  esac
done
shift $((OPTIND - 1))
APK_ROOT="$1"
shift

# bootstrap alpine-keys untrusted from https
apk --root "${APK_ROOT}" --arch "${ALPINE_ARCH}" \
  --repository "https://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/main" \
  --allow-untrusted --update-cache --no-interactive \
  add --initdb --usermode --no-scripts \
  alpine-keys

# set standard repositories
cat >"${APK_ROOT}"/etc/apk/repositories <<EOF
http://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/main
# http://dl-cdn.alpinelinux.org/alpine/${ALPINE_BRANCH}/community
EOF

# ensure we re-create the index with verification, potentially adding more constraints
apk --root "${APK_ROOT}" --update-cache \
  add --usermode --no-scripts "$@"
