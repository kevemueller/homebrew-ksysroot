class Debootstrap < Formula
  desc "Bootstrap a basic Debian system"
  homepage "https://wiki.debian.org/Debootstrap"
  license "MIT"
  revision 1
  head "https://salsa.debian.org/installer-team/debootstrap.git", branch: "master"

  stable do
    url "http://deb.debian.org/debian/pool/main/d/debootstrap/debootstrap_1.0.138.tar.gz"
    sha256 "e8e8b72388b6e5ced65d1b5e69ce0b9e13f4813da0c328a52add57ee5f79430a"
    # https://salsa.debian.org/installer-team/debootstrap/-/commit/ad49a050512dcb5d4bdb3a1fd52624f075664bb3
    patch :p1, <<~PEND
      diff --git a/debootstrap b/debootstrap
      index 00b3e9c..431d6b3 100755
      --- a/debootstrap
      +++ b/debootstrap
      @@ -570,6 +570,9 @@ if [ -z "$HOST_OS" ]; then
       		FreeBSD*)
       			HOST_OS=freebsd
       		;;
      +		Darwin)
      +			HOST_OS=darwin
      +		;;
       	esac
       fi
      #{" "}
      @@ -875,6 +878,13 @@ fi
       if am_doing_phase kill_target; then
       	if [ "$KEEP_DEBOOTSTRAP_DIR" != true ]; then
                       info KILLTARGET "Deleting target directory"
      -		rm -rf --one-file-system "$TARGET"
      +		case "$HOST_OS" in
      +			freebsd|darwin)
      +				rm -rfx "$TARGET"
      +				;;
      +			*)
      +				rm -rf --one-file-system "$TARGET"
      +				;;
      +		esac
       	fi
       fi
      diff --git a/functions b/functions
      index b84c76f..e023e9d 100644
      --- a/functions
      +++ b/functions
      @@ -1306,7 +1306,7 @@ setup_devices () {
       	case "$HOST_OS" in
       	    kfreebsd*)
       		;;
      -	    freebsd)
      +	    freebsd|darwin)
       		;;
       	    hurd*)
       		touch "$TARGET/servers/exec"
      @@ -1840,7 +1840,7 @@ check_sane_mount () {
       	mkdir -p "$1"
      #{" "}
       	case "$HOST_OS" in
      -	    *freebsd*|hurd*)
      +	    *freebsd*|hurd*|darwin)
       		;;
       	    *)
        if ! doing_variant fakechroot; then
    PEND
  end

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4d0049d916545feb8120796093c44b03c587706b4e1e848429ea98c0722cd97f"
    sha256 cellar: :any_skip_relocation, ventura:       "3d9ca7b63ef8406b05643fe4984648f630c2313d5d24375193882cd7f05743f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1b415c5f660b59d0ad0c5604db95a14d6abb9c05a23a78ea7c6c8b307f12292c"
  end
  depends_on "wget"

  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  patch :p1, :DATA

  def install
    prefix.install "debian/copyright" => "LICENSE"
    sbin.install name
    pkgshare.install "functions", "scripts"
    man8.install "#{name}.8"
    inreplace sbin/name do |s|
      s.gsub!("@VERSION@", version.to_s)
      s.gsub!("DEBOOTSTRAP_DIR=/usr/share/#{name}", "DEBOOTSTRAP_DIR=#{share}/#{name}")
    end
    chmod 0755, ["fakechown", "fakeid", "faketar"]
    libexec.install "fakechown" => "chown"
    libexec.install "fakeid" => "id"
    libexec.install "faketar" => "tar"
  end

  def caveats
    <<~EOS
      #{name} must be run with root privileges, as fakeroot does not work on modern macOS, e.g.
        sudo #{sbin}/#{name} --foreign --arch amd64 bookworm my-bokworm-dir
      subcommands not requiring root
        #{sbin}/#{name} --print-debs --arch=amd64 bookworm my-tmp-dir
        #{sbin}/#{name} --download-only --arch=amd64 bookworm my-download-dir

      This version of debootstrap has experimental support for running unprivileged
      and saving the owner/group/permission/flags in a mtree(8) compatible metalog.
        #{sbin}/#{name} --unprivileged --foreign --arch amd64 bookworm my-bokworm-dir
        tail my-bookworm-dir/LOG.mtree
    EOS
  end

  test do
    system sbin/name, "--version"
    assert_match "libc6", shell_output("#{sbin}/#{name} --print-debs --arch=amd64 bookworm my-tmp-dir").strip
    refute_predicate testpath/"my-tmp-dir", :exist?
  end
end
__END__
diff --git a/debootstrap b/debootstrap
index 431d6b3..f2d48fa 100755
--- a/debootstrap
+++ b/debootstrap
@@ -137,6 +137,8 @@ usage()
       --inrelease-path       determine the path to the InRelease file of the main
                              archive relative to the normal position of an InRelease
                              file
+      --unprivileged	     indicate running unprivileged and save owner/group/mode
+                             information in metalog file
 EOF
 }
 
@@ -442,6 +444,11 @@ if [ $# != 0 ] ; then
 			error 1 NEEDARG "option requires an argument %s" "$1"
 		fi
 		;;
+		--unprivileged)
+			UNPRIVILEGED=1
+			export PATH=$DEBOOTSTRAP_DIR/../../libexec:$PATH
+			shift
+			;;
 	    -*)
 		error 1 BADARG "unrecognized or invalid option %s" "$1"
 		;;
diff --git a/fakechown b/fakechown
new file mode 100755
index 0000000..37b0f6d
--- /dev/null
+++ b/fakechown
@@ -0,0 +1,5 @@
+#!/bin/sh
+FILE_UID="${1%:*}"
+FILE_GID="${1#*:}"
+FILE_RELPATH=."${2#"$TARGET"}"
+echo "$FILE_RELPATH" uid="$FILE_UID" gid="$FILE_GID" >> "$TARGET"/LOG.mtree
\ No newline at end of file
diff --git a/fakeid b/fakeid
new file mode 100755
index 0000000..8795598
--- /dev/null
+++ b/fakeid
@@ -0,0 +1,2 @@
+#!/bin/sh
+echo 0
diff --git a/faketar b/faketar
new file mode 100755
index 0000000..73be955
--- /dev/null
+++ b/faketar
@@ -0,0 +1,2 @@
+#!/usr/bin/env bash
+tee >(/usr/bin/tar -cf - --format=mtree @- >> LOG.mtree) | /usr/bin/tar "$@"
diff --git a/functions b/functions
index e023e9d..6f6c099 100644
--- a/functions
+++ b/functions
@@ -1843,7 +1843,7 @@ check_sane_mount () {
 	    *freebsd*|hurd*|darwin)
 		;;
 	    *)
-		if ! doing_variant fakechroot; then
+		if ! ( doing_variant fakechroot -o "$UNPRIVILEGED" = "1" ); then
 		case "$CONTAINER" in
 		  lxc|lxc-libvirt|mmdebstrap-unshare)
 		    ;;

