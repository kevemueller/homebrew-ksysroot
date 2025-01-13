class KsysrootS390xLinuxGnu < Formula
  desc "Sysroot for s390x-linux-gnu@Debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "1091e2e6314c063e00234cb7694b5d03900c292f5025ebcc362770079a612d2e"
  license "GPL-2.0-or-later"
  head "https://github.com/kevemueller/ksysroot.git", using: :git, branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49e5b94f5234d42b7037a1e0357049721c4c8dc2dae18a14aae8892bf3089a39"
    sha256 cellar: :any_skip_relocation, ventura:       "59874a251edcf58a5c484255dd4665557cd913b2a3b5b4b1e379a5cfe0bf1297"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3c3b7edef4399bf6a36534de43bebf323b9842f71053fa03267dc572d8feeaa1"
  end

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
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "cc202d7b9e4620b01ab7acdbd2ad12b0a1333e8bfdb75ab98d92feddbedcdcc2"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "97e7fc481f31f81bfa484b54ba4010abee40ed820fd7004dc41c3e284ef85d1a"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "a167a56a078986d7d945613f3461fc903aff7bcc3d0609ce4fe9661b0f2480ec"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_s390x.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "904d8ee37ea1c29a04194d4b15a92a0dbc0ff578579004fe95531e86a88e68bf"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_s390x.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "c97826389873c0faff26376fb88d493bec451f0e9fc29cd2f04562a78823e6b1"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_s390x.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "fdc9e23958c9ba1e0826dba20e8b661bf9fdd5c8e570611a6c01648278355d41"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_s390x.deb"
    version "1.47.0-2-ksr"
    sha256 "96945d979600e9a63eefe33039a9a72b95527fa80ab53a955f21040450a2fd24"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_s390x.deb"
    version "1:4.4.33-2-ksr"
    sha256 "97ac7f93860916a7974e4d82deb7515814c8b16bf1f52ab928cc3f128f8b7bb9"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_s390x.deb"
    version "1:4.4.33-2-ksr"
    sha256 "9c7fc22abd79945ee813450f7929f9349bd370bcdc979c4e128e884344169e1f"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "3b0eef55d39ff7608f1ff6b74229d585aa3aa038b3caaf8c91384c0f41860c05"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "beb6ead3623332a8d65523293b45c6770fe0f8396e13f9d9da2b38a905ef822b"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "c2c6111858661a8136ae8c41f465c851469740e6ae3e70b4d842b076a9c1eaf1"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_s390x.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "334e60df8b2f6849bb050ec358e0789296ebea48d2096090ffa196a9928207e4"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libitm1_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "add0fa2bd7d243a1335b6c14e6139a5c8054dd29ded02d02663ed128ab715806"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_s390x.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "f098d74b0c4f54091ed086685d21f251d9d526f30a8997acc3411642a1170b8c"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_s390x.deb"
    version "1.6.3-2-ksr"
    sha256 "66ed2416e525f602d529d7f433f68beb695ff17325430e2d080f8180c84e06cb"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_s390x.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "55eacf7d1a4954a99e4c832f1a866f975d20a030ace6cdff8d49fd717f579215"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_s390x.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "4910a38470f50820a41234542c1f7259ea168c93c6ba4a33cd04681722647ae5"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_s390x.deb"
    version "1.3.0-2-ksr"
    sha256 "57c31d0d9feb3d9524aaf80043a6206334205272c90f595bc171ce0234600b6c"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_s390x.deb"
    version "1.3.0-2-ksr"
    sha256 "861496c42f7c2e60a4b9a45ba01b3f9985cd3ab19558b9fc616991f7bd1f7baf"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_s390x.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "668f12e1efc8c228a69bd14f31965539e47ceb40e785b6b31046a8ef45c31133"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "1604cb8171d73b14a4c6c25ad9bd598821867cb20984f64ee94712f2aea8a292"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "04dbe0085f54cc8383a79fa0e77e5dd380738b0f5a29b72d8d189acc43be86d9"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_s390x.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "0f84f5ff4e77921e85c4913f69c4abddd4b1512d2343f7e2b4511a5f9964b92c"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_s390x.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "0a764fc2f5569fd4e8606dc393beb9db323d3469f3db238b5bc20248e602d014"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_s390x.deb"
    version "12.2.0-14-ksr"
    sha256 "0b58df741d5ca5c3bb4e71e40b2d1ff7d9cb7328e842d424f2722418160e0611"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.123-1_s390x.deb"
    version "6.1.123-1-ksr"
    sha256 "dfcd46451b4de8129c4cdef0f2c70f8313cd1b908dd195c42d209f87f372c7a2"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_s390x.deb"
    version "1.4.3-1-ksr"
    sha256 "5f63ce83bf1a0d4fa18e5bd098d11e03a21b500e13e30981b15e61af76ca266a"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=s390x-linux-gnu KSYSROOT_FULL_TRIPLE=s390x-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=Debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=s390x MESON_CPU=s390x MESON_ENDIAN=big
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=s390x LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="s390x-linux-gnu"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "s390x-linux6.1-gnu"
    meson_cross.install_symlink meson_cross/"s390x-linux6.1-gnu" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootS390xLinuxGnu.stable.url
      sha256 KsysrootS390xLinuxGnu.stable.checksum.hexdigest
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
             "--cross-file=s390x-linux6.1-gnu", testpath/"build"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build"
      # test for the executables
      assert_predicate testpath/"build/test-c/main", :exist?
      assert_predicate testpath/"build/test-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/s390x-linux6.1-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/s390x-linux6.1-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
