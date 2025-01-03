class KsysrootX8664LinuxGnu < Formula
  desc "Sysroot for x86_64-linux-gnu@debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7acb24723df2a3156417061896a108f13bb7d80d6dea936f9281cdc2c6b0ce77"
    sha256 cellar: :any_skip_relocation, ventura:       "96d8dd0369ada547f0cf5440ea02c17efe46e9fa53795fe487966d6b1e32c6d0"
  end

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"
  uses_from_macos "libarchive"

  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "gcc-12-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "1a03df5a57833d65b5bb08cfa19d50e76f29088dc9e64fb934af42d9023a0807"
  end
  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "30b4972cc88a4ff0fba9e08e6d476de13b109af9e4b826d130bdc72771d6e373"
  end
  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "a35f744972476c4b425e006d5c0752d917f3a6f48ce1268723a29e65a65b78a6"
  end
  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_amd64.deb"
    version "2.36-9+deb12u9"
    sha256 "dc67f573148d239711c279d2eb43ddf3dac36a600b59b71d09d26ac3fa9eca34"
  end
  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_amd64.deb"
    version "2.36-9+deb12u9"
    sha256 "3a043b9dbf1a8c8b5a9e2268253e6dca8c7d431bd7a202fea96364abf374fea9"
  end
  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_amd64.deb"
    version "2.36-9+deb12u9"
    sha256 "da2062fa167bdfe02349e062f9fb7c063e06f778ad4c14404adeea0eafa80c0c"
  end
  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_amd64.deb"
    version "1.47.0-2"
    sha256 "8010e4285276bb344c05ae780deae2fffb45e237116c3a78481365c5954125ec"
  end
  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_amd64.deb"
    version "1:4.4.33-2"
    sha256 "81ccd29130f75a9e3adabc80e61921abff42f76761e1f792fa2d1bb69af7f52f"
  end
  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_amd64.deb"
    version "1:4.4.33-2"
    sha256 "f5f60a5cdfd4e4eaa9438ade5078a57741a7a78d659fcb0c701204f523e8bd29"
  end
  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "6ffd3721915c49580fc9bcf1ef06deab4ad59e99c52c9f349d03954642b97655"
  end
  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "f3d1d48c0599aea85b7f2077a01d285badc42998c1a1e7473935d5cf995c8141"
  end
  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "1dbc499d2055cb128fa4ed678a7adbcced3d882b3509e26d5aa3742a4b9e5b2f"
  end
  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_amd64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "454eb2ecb79e03682b176f04a54b8820ccf8868c074995d96fb6f4736f546cec"
  end
  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libitm1_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "a6b79588938ef738fe6f03582b3ca0ed4fbd4a152dbe9f960e51a0355479a117"
  end
  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_amd64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "de8ae0c2bb31c926b24c374c1159e8b8d5f9817421f45dd29f22cd201982ee3d"
  end
  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_amd64.deb"
    version "1.6.3-2"
    sha256 "cfac89e6a7a54ff3c6a4f843310e25efeddaa771baeae470bd98bd588c373563"
  end
  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_amd64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "9ce3d67db89417e1539f33a62ce85959dc96e3865ecad77606e2af1e6680d6da"
  end
  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_amd64.deb"
    version "1.20.1-2+deb12u2"
    sha256 "3bb1a8f9cfdd31f92e0cdd0a040c738a2de0d343afe7f830850e3ab7695e649c"
  end
  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/liblsan0_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "c6a494d3605341a2c909e280f81fa015a4c8df2de8624c88a712a7f98a63f057"
  end
  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_amd64.deb"
    version "1.3.0-2"
    sha256 "bb81a188c119cd7fdebae723cbc95887b6c549b2fe4fb7e268a9c8846444da99"
  end
  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"
    version "1.3.0-2"
    sha256 "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8"
  end
  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libquadmath0_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "4e21728bbb1f170f35a5d60fe26adadb48c436f1b5fd977454e632668074169c"
  end
  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_amd64.deb"
    version "3.0.15-1~deb12u1"
    sha256 "d7897e6c55a8d9e229dcf16b0b1d472d7f7be741b2b3b2ac624908ff63215a93"
  end
  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "a0f0f3fbeb661d9bda139a54f4bd1c30aa66cd55a8fa0beb0e6bc7946e243ca1"
  end
  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "9b1b269020cec6aced3b39f096f7b67edd1f0d4ab24f412cb6506d0800e19cbf"
  end
  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end
  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_amd64.deb"
    version "1.3.3+ds-1"
    sha256 "03326473eed54ffa27efae19aa5d6aeb402930968f869f318445513093691d55"
  end
  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_amd64.deb"
    version "1.3.3+ds-1"
    sha256 "2a46d5a5e9486da11ffeff5740931740d6deae4f92cd6098df060dc5dff1e1c7"
  end
  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libtsan2_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "d8e04be2cd7f8299668020b1c2a13ce07a1b79e73c901338a6fabd77ccabf004"
  end
  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_amd64.deb"
    version "12.2.0-14"
    sha256 "e46fbb519b4342c114b2fa19bcdb736e294eadc769fae75d6bc2e94a4db67f15"
  end
  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.115-1_amd64.deb"
    version "6.1.115-1"
    sha256 "7d0ec478dce658dc5ed821871ca9698724f86ffd6cca06ab6b80b7f2bcb013a0"
  end
  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_amd64.deb"
    version "1.4.3-1"
    sha256 "32ac0692694f8a34cc90c895f4fc739680fb2ef0e2d4870a68833682bf1c81a3"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-linux-gnu KSYSROOT_FULL_TRIPLE=x86_64-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=amd64 LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version} #{r.url} #{r.cached_download.to_s.delete_prefix(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    system "./ksysroot.sh", "frombom", prefix, "bom.in"
  end
  test do
    resource "testcases" do
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
      sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
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
      # build a C library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check pkg-config personality is proper
      assert_equal "-lcrypt", shell_output("#{bin}/x86_64-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/x86_64-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
