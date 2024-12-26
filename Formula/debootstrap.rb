class Debootstrap < Formula
  desc "Bootstrap a basic Debian system"
  homepage "https://wiki.debian.org/Debootstrap"
  license "MIT"
  head "https://salsa.debian.org/installer-team/debootstrap.git", branch: "master"

  stable do
    url "http://deb.debian.org/debian/pool/main/d/debootstrap/debootstrap_1.0.138.tar.gz"
    sha256 "e8e8b72388b6e5ced65d1b5e69ce0b9e13f4813da0c328a52add57ee5f79430a"
    # https://salsa.debian.org/installer-team/debootstrap/-/commit/ad49a050512dcb5d4bdb3a1fd52624f075664bb3
    patch :DATA
  end

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3a5158e6c6a00520f2efee139754d8bb4940b0996e031dbc0e2aa88c7f3d583"
    sha256 cellar: :any_skip_relocation, ventura:       "c3e0126af6d5652a5784b28013fb86d3249d76345b3b3ccde775cf9b0e429770"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cb7ff328d5775204e8c54e11b08f3e9bd2b23e72374e2af622f5e8a742f7c4d9"
  end

  depends_on "wget"
  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  def install
    prefix.install "debian/copyright" => "LICENSE"
    sbin.install name
    pkgshare.install "functions", "scripts"
    man8.install "#{name}.8"
    inreplace sbin/name do |s|
      s.gsub!("@VERSION@", version.to_s)
      s.gsub!("DEBOOTSTRAP_DIR=/usr/share/#{name}", "DEBOOTSTRAP_DIR=#{share}/#{name}")
    end
  end

  def caveats
    <<~EOS
      #{name} must be run with root privileges, as fakeroot does not work on modern macOS, e.g.
        sudo #{sbin}/#{name} --foreign --arch amd64 bookworm my-bokworm-dir
      subcommands not requiring root
        #{sbin}/#{name} --print-debs --arch=amd64 bookworm my-tmp-dir
        #{sbin}/#{name} --download-only --arch=amd64 bookworm my-download-dir
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
 
 	case "$HOST_OS" in
-	    *freebsd*|hurd*)
+	    *freebsd*|hurd*|darwin)
 		;;
 	    *)
 		if ! doing_variant fakechroot; then