class KsysrootMips64elLinuxGnuabi64 < Formula
  desc "Sysroot for mips64el-linux-gnuabi64@Debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "GPL-2.0-or-later"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  depends_on "meson" => :test
  depends_on "ksysroot_native"
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"
  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  resource "gcc-12-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "2a9bda41f7ebe58630580a3f50b33624b019ac0ed62f593a0fe7c908641621b0"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "a21dcfd9ec1aa97d7bf3634138e695bbdd53efbe0e70b88998f65d45a3472ff1"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_mips64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "c7bec46674d3b380d5bc43836f9e10189bb7c2e96d6e36e428e3cb083fb07f9a"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_mips64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "e55005f4efe807211108006ce3ec1bd0cd1ac91e658b1a8ec5c813acbba4035e"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_mips64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "0d0f73eb0070d62d8ed8e3ef9186ddd568a76f8fe049ed76ff8be4c8cfe51aac"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_mips64el.deb"
    version "1.47.0-2-ksr"
    sha256 "dae7f40c045ba02938a08d2f65a4cf3c4a131191b0a939397e3e5b4ca6b2c5bf"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_mips64el.deb"
    version "1:4.4.33-2-ksr"
    sha256 "125216cbe11d7b88ad17fd765893e0ffd7d94667726798b6984bb1d88a5fc60b"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_mips64el.deb"
    version "1:4.4.33-2-ksr"
    sha256 "41b2b616561722bebfd03b705176e6741ab7f8e77df498792f3799443453fd6d"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "97c9d6fe30c71936bc10d3246a680d978090939924e73e95787d1624a86a6e68"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "66dc2418bd0b3070d8bb88017926c6ec224f5afa77cd3f852c00b84dae014656"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "79ee9cb874ab1e9fb0d4eab5844b9968f0c9b26b2fd5f8de19c1c4a9c9dba972"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_mips64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "b68fefc732d516d8b3b78b8f4c5de5a4829dc5f37bad78188677a78c05d35f28"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_mips64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "66fcf1e50486da2633b3cd36aaec7f3d3293b0e9c09b15fb9d5fb00543c31135"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_mips64el.deb"
    version "1.6.3-2-ksr"
    sha256 "db7553ac1c839670b840303fde417507c0f91765dc01663196fc245aa6f10838"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_mips64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "113e430ec38d964532a8e82f0f6ea003888d5572fb4aa4cc3283966a6c2abffe"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_mips64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "5e61124e8963462c29a56a21e16b78359e7f8c7d9a069457edebf7e42a71f74c"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_mips64el.deb"
    version "1.3.0-2-ksr"
    sha256 "bc0f36edb1b4346cb4424c6c34d2d1974eb9da736416683a31983469d2248155"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_mips64el.deb"
    version "1.3.0-2-ksr"
    sha256 "4503e4d6b83e4fb0fb0cbd977adbd88cb734b5701b6f01782e5a82fb5f60a984"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_mips64el.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "0a9bdc4c01e55f0fbee2bc2146030c6655204e313515781fff05667999941416"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "d8cdc641d506777c0b11df6ff27163ca810be079da2c2490a5425db1e1492ef3"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_mips64el.deb"
    version "12.2.0-14-ksr"
    sha256 "3e86bb3ff74194fd95157ec6f0ed7834691fba8664448df72c3b112c452e0ff1"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_mips64el.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "7de45297af56d0788d52b30e56f524a831f91b51ba622cc3e709ab9aa1db0fb7"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_mips64el.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "25933ae1c996bfaaeb8fb018bdf113d9ee801fe2f60ffa8899aff70ec46953f6"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.123-1_mips64el.deb"
    version "6.1.123-1-ksr"
    sha256 "055fd8c00048e28f49dfdd6ef8a1396eaab355cab0ac544fd760baa5bfad41a2"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_mips64el.deb"
    version "1.4.3-1-ksr"
    sha256 "1b34e89ec12a59b795d53352b94d73223aba96f77f1307e77c1531469ba3f0bc"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=mips64el-linux-gnuabi64 KSYSROOT_FULL_TRIPLE=mips64el-linux6.1-gnuabi64
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=mips64 MESON_CPU=mips64 MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=mips64el LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="mips64el-linux-gnuabi64"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "mips64el-linux6.1-gnuabi64"
    meson_cross.install_symlink meson_cross/"mips64el-linux6.1-gnuabi64" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootMips64elLinuxGnuabi64.stable.url
      sha256 KsysrootMips64elLinuxGnuabi64.stable.checksum.hexdigest
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
             "--cross-file=mips64el-linux6.1-gnuabi64", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/mips64el-linux6.1-gnuabi64-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/mips64el-linux6.1-gnuabi64-pkg-config --cflags libcrypt").strip
    end
  end
end
