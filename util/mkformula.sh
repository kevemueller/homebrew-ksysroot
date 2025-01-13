#!/bin/sh
set -e

AWK="awk"
CURL="curl"
MKTEMP="mktemp"
SHA256SUM="sha256sum"
TAR="bsdtar"

CACHE_DIR=cache
BUILD_DIR=build

capitalize() {
  local suffix="${1#?}"
  echo "$(echo "${1%"${suffix}"}" | tr '[:lower:]' '[:upper:]')$(echo "${suffix}" | tr '[:upper:]' '[:lower:]')"
}

# remove block marked by $1, if omitted bottle from $2, if omitted stdin
unbottle() {
  local blockmarker
  if [ -n "$1" ]
  then
    blockmarker="$1"
    shift
  else
    blockmarker="bottle"
  fi
  ${AWK} " 
      /do/ && inbottle { inbottle++;}
      /^ *${blockmarker} do/ { inbottle=1; }
      !inbottle { print }
      /^ *end/ && inbottle { inbottle--; getline; if (!//) { print }}" "$@"
}

# shellcheck disable=SC2120
unrevision() {
  sed -E '/^ *revision ([0-9]+)$/d' "$@"
}

list_exceptions() {
  echo "{"
  local first=""
  find ../Formula -name "ksysroot_*.rb" | while IFS= read -r file; do
    formula="$(basename "${file}")"
    formula="${formula%.rb}"
    if [ "${formula}" = "ksysroot_native" ]
    then
      continue
    fi

    printf '%s\n"%s": "cross/**/*"' "${first}" "${formula}"
    first=","
  done
  echo "}"
}

fetch_ksysroot() {
  local ksysroot_version
  ksysroot_version="$(curl --silent https://api.github.com/repos/kevemueller/ksysroot/releases/latest | jq -r .tag_name)"
  # ksysroot_version=v0.8
  KSYSROOT_URL=https://github.com/kevemueller/ksysroot/archive/refs/tags/"${ksysroot_version}".tar.gz
  : "${KSYSROOT_GIT:="https://github.com/kevemueller/ksysroot.git"}"

  ${CURL} --silent --fail -L -o "${CACHE_DIR}"/ksysroot.tar.gz "${KSYSROOT_URL}"
  KSYSROOT_SHA=$(${SHA256SUM} "${CACHE_DIR}"/ksysroot.tar.gz | cut -d" " -f 1)
  KSYSROOT_DIR="${BUILD_DIR}"/ksysroot
  rm -rf "${KSYSROOT_DIR}"
  mkdir -p "${KSYSROOT_DIR}"
  ${TAR} -C "${KSYSROOT_DIR}" --strip-components=1 -xf "${CACHE_DIR}"/ksysroot.tar.gz
}

# $1 - bomfile
# $2 - target_directory
# ${REVISION}
emit_package() {
  local bomfile="$1"
  local tgt_dir="${2:-.}"
  local package_file
  local link_triple=
  local depnative=

  1>&2 cat "${bomfile}"
  1>&2 echo
  1>&2 echo

  local KSYSROOT_OSRELEASE
  local KSYSROOT_OSFLAVOUR
  local KSYSROOT_FULL_TRIPLE
  local KSYSROOT_TRIPLE
  local KSYSROOT_LICENSE
  local MESON_CPUFAMILY

  # shellcheck disable=SC2046
  export $(sed -nE 's/^#(.*)$/\1/p' "${bomfile}" | xargs)

  if [ "${KSYSROOT_OSRELEASE}" = "edge" ]
  then
    KSYSROOT_OSRELEASE="99edge"
  fi

  flavour_number="${KSYSROOT_OSRELEASE%-*}"
  flavour_text="$(echo "${KSYSROOT_OSRELEASE#"${flavour_number}"}" | tr '[:upper:]' '[:lower:]')"
  flavour_os="$(echo "${KSYSROOT_OSFLAVOUR}" | tr '[:upper:]' '[:lower:]')"
  package="ksysroot_${KSYSROOT_FULL_TRIPLE}@${flavour_number}-${flavour_os}${flavour_text}"

  local disable=

  if [ "${KSYSROOT_TRIPLE}" = "native" ]
  then
    cross_file=
    uses_from_macos=
    depnative=
    package="ksysroot_native"
  else
    cross_file="\"--cross-file=${KSYSROOT_FULL_TRIPLE}\", "
    uses_from_macos="  uses_from_macos \"libarchive\"
"
    depnative="  depends_on \"ksysroot_native\"
"
    case "${KSYSROOT_OSFLAVOUR}" in
      Alpine)
        if [ "${KSYSROOT_OSRELEASE}" = "v3.21" ]
        then
          lpackage="${package}"
          package="ksysroot_${KSYSROOT_TRIPLE%-alpine*}-${KSYSROOT_TRIPLE#*alpine-}"
          link_triple="${KSYSROOT_TRIPLE}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        ;;
      "Debian")
        if [ "${KSYSROOT_OSRELEASE}" = "12" ]
        then
          lpackage="${package}"
          package="ksysroot_${KSYSROOT_TRIPLE}"
          link_triple="${KSYSROOT_TRIPLE}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        test_pkgconfig=libcrypt
        test_pkgconfig_expect=-lcrypt
        ;;
      DragonFlyBSD)
        if [ "${KSYSROOT_OSRELEASE}" = "6.4" ]
        then
          lpackage="${package}"
          package="${package%6.4@*}"
          link_triple="${KSYSROOT_TRIPLE%6.4}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        test_pkgconfig=libcrypto
        test_pkgconfig_expect=-lcrypto
        ;;
      FreeBSD)
        if [ "${KSYSROOT_OSRELEASE}" = "14.2-RELEASE" ]
        then
          lpackage="${package}"
          package="${package%14.2@*}"
          link_triple="${KSYSROOT_TRIPLE%14.2}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        test_pkgconfig=libcrypto
        test_pkgconfig_expect=-lcrypto
        ;;
      NetBSD)
        if [ "${KSYSROOT_OSRELEASE}" = "10.1" ]
        then
          lpackage="${package}"
          package="${package%10.1@*}"
          link_triple="${KSYSROOT_TRIPLE%10.1}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        ;;
      OpenBSD)
        if [ "${KSYSROOT_OSRELEASE}" = "7.6" ]
        then
          lpackage="${package}"
          package="${package%7.6@*}"
          link_triple="${KSYSROOT_TRIPLE%7.6}"
          echo "${lpackage}" >"${tgt_dir}/${package}".alias
        fi
        ;;
      *) ;;
    esac
  fi

  formula=$(
    IFS="_-"
    for i in ${package}
    do
      printf "%s" "$(capitalize "${i}")"
    done | sed 's/@/AT/;s/\.//g'
  )

  package_file="${tgt_dir}/${package}".rb
  if [ -n "${REVISION}" ]
  then
    revision="  revision ${REVISION}
"
  else
    revision=
  fi

  if [ "${KSYSROOT_TRIPLE}" != "native" ] && [ "${MESON_CPUFAMILY}" = "x86_64" ]
  then
    case "${KSYSROOT_OSFLAVOUR}" in
      Alpine | Debian | NetBSD | DragonFlyBSD)
        disable="  on_linux do
    disable! date: \"2024-01-01\", because: \"Unwanted system libraries\"
  end
"
        ;;
      *) ;;
    esac
  fi

  cat >"${package_file}" <<EOF
class ${formula} < Formula
  desc "Sysroot for ${KSYSROOT_TRIPLE}@${KSYSROOT_OSFLAVOUR}${KSYSROOT_OSRELEASE}"
  homepage "https://github.com/kevemueller/ksysroot"
  url "${KSYSROOT_URL}"
  sha256 "${KSYSROOT_SHA}"
  license "${KSYSROOT_LICENSE}"
${revision}  head "${KSYSROOT_GIT}", using: :git, branch: "main"

${version}  depends_on "meson" => :test
${depnative}  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

${uses_from_macos}  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end
${disable}
EOF

  local pkg version url file file_sha256
  while read -r pkg version url file file_sha256
  do
    # 1>&2 echo PKG="${pkg}" URL="${url}" FILE="${file}"
    test "${pkg}" = "#" && continue
    if [ ${#file_sha256} -ne 64 ]
    then
      cache_file="$(cache "${url}" "${file}" "${file_sha256}")"
      file_sha256="$(sha256sum "${cache_file}" | cut -d" " -f 1)"
    fi

    cat <<EOF
  resource "${pkg}" do
    url "${url}"
    version "${version}-ksr"
    sha256 "${file_sha256}"
  end

EOF
  done <"${bomfile}" >>"${package_file}"

  {
    cat <<EOF
  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
EOF

    if [ "${KSYSROOT_TRIPLE}" = "native" ]
    then
      cat <<EOF
    system "./ksysroot.sh", "install", "native", prefix
    mkdir "#{share}/meson/native"
    share.install "#{prefix}/native.txt" => "meson/native/ksysroot"
  end
EOF
    else
      cat <<EOF
    bom = <<~EOS
EOF
      sed -nE 's/^(#.*)$/      \1/p' "${bomfile}" >>"${package_file}"
      cat <<EOF
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \\
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="${link_triple}"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "${KSYSROOT_FULL_TRIPLE}"
    meson_cross.install_symlink meson_cross/"${KSYSROOT_FULL_TRIPLE}" => link_triple unless link_triple.empty?
  end
EOF
    fi
    cat <<EOF
  test do
    resource "testcases" do
      url ${formula}.stable.url
      sha256 ${formula}.stable.checksum.hexdigest
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
      # build a C and C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             ${cross_file}testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
EOF
    if [ "${KSYSROOT_TRIPLE}" = "native" ]
    then
      cat <<EOF
      # check that pkg-config runs
      system bin/"native-pkg-config", "--list-all"
EOF
    elif [ -n "${test_pkgconfig}" ]
    then
      cat <<EOF
      # check pkg-config personality is properly set-up
      assert_equal "${test_pkgconfig_expect}", shell_output("#{bin}/${KSYSROOT_FULL_TRIPLE}-pkg-config --libs ${test_pkgconfig}").strip
      assert_equal "", shell_output("#{bin}/${KSYSROOT_FULL_TRIPLE}-pkg-config --cflags ${test_pkgconfig}").strip
EOF
    fi
    cat <<EOF
    end
  end
end
EOF
  } >>"${package_file}"
  echo "${package_file}"
}

usage() {
  echo "Usage: "
  echo "  $0 {iterate|iterate1|iterate2|iterate3}"
  echo "  $0 new"
  echo "  $0 mod"
}

setup() {
  mkdir -p "${CACHE_DIR}" "${BUILD_DIR}"
  fetch_ksysroot

  # shellcheck disable=SC1091
  . "${KSYSROOT_DIR}"/functions

  rmdir -p "${BUILD_DIR}/new" "${BUILD_DIR}/mod" 2>/dev/null || true
}

iterate() {
  local cmd="$1"
  local filter="${2:-.}"
  echo "Iterating"

  bom=$(${MKTEMP})
  "${KSYSROOT_DIR}"/ksysroot.sh "${cmd}" | grep "${filter}" | while IFS= read -r flavour; do
    echo
    echo "==> working" on "${flavour}"
    REVISION=

    if find "${CACHE_DIR}/${flavour}.bom" -newermt "2 days ago"
    then
      echo Using caced BOM "${CACHE_DIR}/${flavour}.bom"
      cp "${CACHE_DIR}/${flavour}.bom" "${bom}"
    else
      "${KSYSROOT_DIR}"/ksysroot.sh bom "${flavour}" | tee "${CACHE_DIR}/${flavour}.bom" >"${bom}"
    fi
    new_package_file=$(emit_package "${bom}" build)
    old_package_file=../Formula/"$(basename "${new_package_file}")"
    if [ -e "${old_package_file}" ]
    then
      unbottle bottle "${old_package_file}" | unrevision >"${new_package_file}.org"
      if diff -sq "${new_package_file}".org "${new_package_file}"
      then
        echo "=>" Unchanged "${old_package_file}"
        rm -f "${new_package_file}" "${new_package_file%.rb}.alias" "${new_package_file}".org
      else
        echo "=>" Modified "${old_package_file}"
        KSYSROOT_URL_OLD="$(sed -nE 's%^ *url +"(.*kevemueller/ksysroot/archive/refs/tags.*)"$%\1%p' "${old_package_file}" | uniq)"
        mkdir -p "${BUILD_DIR}/mod"
        rm "${new_package_file}.org"
        if [ "${KSYSROOT_URL_OLD}" = "${KSYSROOT_URL}" ]
        then
          REVISION_OLD="$(sed -nE 's/^ *revision ([0-9]+)$/\1/p' "${old_package_file}")"
          REVISION="$((REVISION_OLD + 1))"
          echo "bump revision ${REVISION_OLD} to ${REVISION}"
          new_package_file=$(emit_package "${bom}" build)
        fi
        mv -f "${new_package_file}" "${new_package_file%.rb}.alias" "${BUILD_DIR}/mod" 2>/dev/null || true
      fi
    else
      echo "=>" new "${new_package_file}"
      mkdir -p "${BUILD_DIR}/new"
      mv -f "${new_package_file}" "${new_package_file%.rb}.alias" "${BUILD_DIR}/new" || true
    fi
    # exit 1
  done
  rm "${bom}"
}

new() {
  echo "Processing new entries"
  branch="prm_new"
  git checkout -b "${branch}"
  find "${BUILD_DIR}/new" -name "*.rb" | while IFS= read -r package; do
    base=$(basename "${package}")
    echo new "${base}"
    if [ -e "${package%.rb}.alias" ]
    then
      ln -sf "../Formula/${base}" ../Aliases/"$(cat "${package%.rb}.alias")"
      rm "${package%.rb}.alias"
    fi
    unbottle test "${package}" >../Formula/"${base}"
    rm "${package}"
  done
  list_exceptions | jq --sort-keys >../audit_exceptions/mismatched_binary_allowlist.json
  git add ../Aliases/* ../Formula/* ../audit_exceptions/*
  git commit -m"new"
  git push
  gh pr create --title "new" --body "new"
  git checkout main
  git branch -d "${branch}"
}

mod() {
  echo "Processing modified entries"
  find "${BUILD_DIR}/mod" -name "*.rb" | while IFS= read -r package; do
    base=$(basename "${package}")
    echo make "${base}"
    if [ -e "${package%.rb}.alias" ] || [ "${base}" = "ksysroot_native.rb" ]
    then
      branch="prp_${base%.rb}"
    else
      branch="prm_${base%.rb}"
    fi
    git checkout -b "${branch}"
    mv "${package}" ../Formula
    if [ -e "${package%.rb}.alias" ]
    then
      ln -sf "../Formula/${base}" ../Aliases/"$(cat "${package%.rb}.alias")"
      rm "${package%.rb}.alias"
    fi
    git add ../Aliases/* ../Formula/*
    brew style "../Formula/${base}"
    git commit -m"update ${base%.rb}"
    git push
    gh pr create --title "update ${base%.rb}" --body "update ${base%.rb}"
    git checkout main
    git branch -d "${branch}"
  done
}

if [ $# -eq 0 ]
then
  usage
  exit 1
fi

cmd="$1"
shift

setup

case "${cmd}" in
  iterate*)
    rm -rf "${BUILD_DIR}/new" "${BUILD_DIR}/mod"
    iterate "${cmd}" "$@"
    ;;
  new)
    new "$@"
    ;;
  mod)
    mod "$@"
    ;;
  *) ;;
esac

exit 0
