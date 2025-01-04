class KsysrootPowerpc64leLinuxGnu < Formula
  desc "Sysroot for powerpc64le-linux-gnu@debian12"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "df05e2cd464e92d2b4582878e685ddf30a97e457b015c2a573d3cfa2f005f5a5"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  depends_on "meson" => :test
  depends_on "lld"
  depends_on "llvm"
  depends_on "pkgconf"

  uses_from_macos "libarchive"

  on_sonoma :or_older do
    # for sha256sum
    depends_on "coreutils"
  end

  resource "gcc-12-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/gcc-12-base_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "ba3e53b27c61493e5e00d4c623929cb601429ee42a801bb76f338fc39c29f32a"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libasan8_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "c0083427327dc966d3edcafb0eed664b2bbe60ed8f9c18fe74d95d6525158c6b"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libatomic1_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "e9e9592e89493ac4d62abe079aa0765c3fe63725de11aee8a5aaaeda33522720"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.36-9+deb12u9_ppc64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "99976331e896383f8a6cadfe5ccedbe773b7eeffbce7be79f7850648d6457bb4"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.36-9+deb12u9_ppc64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "0b93576e0b67c15784abffe18d502166b79e6d9df46d554b3db233854509a769"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.36-9+deb12u9_ppc64el.deb"
    version "2.36-9+deb12u9-ksr"
    sha256 "bd10bc5cfc55b94ae78f8b17bca077ca40f15673e237846a5d490120dd9f8584"
  end

  resource "libcom-err2" do
    url "http://deb.debian.org/debian/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_ppc64el.deb"
    version "1.47.0-2-ksr"
    sha256 "0906ed8c71edcc69bbdf8c953e58b1439b88d43bc6eb6787f92d706dcfcd82f4"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.33-2_ppc64el.deb"
    version "1:4.4.33-2-ksr"
    sha256 "498a174b0130f4266a8859599d3375862674e7f8ae0b330a0baee4fed013c493"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_ppc64el.deb"
    version "1:4.4.33-2-ksr"
    sha256 "c5825784746727b7f8338c4de6caaa0d5945737628420f9a7cd8f0fc582372e6"
  end

  resource "libgcc-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-12-dev_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "998cb15d3adaf9e311b4ee29a4d3aaa9e02a869ccf51da9fddaf3bc5361f54a3"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "1cdcfe462d116a33797ec9867519c0f1f4b7819b8914b6ec70faaaf8369d1e40"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libgomp1_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "846fd545da0298a750d57f52ec59689d219c79d9693f15a1dfd6e141ff173e1e"
  end

  resource "libgssapi-krb5-2" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u2_ppc64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "43d0bb86b2eebe17366787c30edaea0fcb235ec6d1b4ee83f27243325c8287b6"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libitm1_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "0b4cc8b691a5fec009cd98de359035c7e9e27af81030d6e6b3aef17a2ba0813a"
  end

  resource "libk5crypto3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u2_ppc64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "8fecb394a7aabe37fb58d44f5f47043ded2e21f7bf3ecdb25ab3ac37de8e490f"
  end

  resource "libkeyutils1" do
    url "http://deb.debian.org/debian/pool/main/k/keyutils/libkeyutils1_1.6.3-2_ppc64el.deb"
    version "1.6.3-2-ksr"
    sha256 "9788f3a9e791d467f502d1597e19108da260d51246bdf7df67c4ef4c813ba72d"
  end

  resource "libkrb5-3" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u2_ppc64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "f193bf6d0a521a6751474b0734e911cd76ccce8c02ac06d21a1f3fe2d659f177"
  end

  resource "libkrb5support0" do
    url "http://deb.debian.org/debian/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u2_ppc64el.deb"
    version "1.20.1-2+deb12u2-ksr"
    sha256 "043ea83c7f7bcd229fe94b42f8de3a078ee11c7f56a4a61e18b4e1f93e54908b"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/liblsan0_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "9a9e82aa0d5fc5005956239235f8f8b869eaa668dec4bc7a14f862040d045bd6"
  end

  resource "libnsl-dev" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl-dev_1.3.0-2_ppc64el.deb"
    version "1.3.0-2-ksr"
    sha256 "59b1a2785b985faee262484a693c508c191d994af6bebdffcb1dc2e11a035dcd"
  end

  resource "libnsl2" do
    url "http://deb.debian.org/debian/pool/main/libn/libnsl/libnsl2_1.3.0-2_ppc64el.deb"
    version "1.3.0-2-ksr"
    sha256 "2617258d97603d0a97f51e9ff7f8e198ea4f86fe5bdf517d1d69f27e78dbdd34"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libquadmath0_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "9925abcfca60020ff63ab585a5bd54debaa3b3cf9edd5f8697a082ddb8078262"
  end

  resource "libssl3" do
    url "http://deb.debian.org/debian/pool/main/o/openssl/libssl3_3.0.15-1~deb12u1_ppc64el.deb"
    version "3.0.15-1~deb12u1-ksr"
    sha256 "ded311817bb81ebdf2c2e4d1a26bd37df01f01b0b3600b4d34d3ad3d11efd872"
  end

  resource "libstdc++-12-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++-12-dev_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "2b82468f93d57e93b34591cde97e94aa61fd4fb99bb64ac126a04ef69705932c"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libstdc++6_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "87e77916ddf0ac175e8fff101dfc93a3348187d87b0eba8089c6dc320e34ec20"
  end

  resource "libtirpc-common" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-common_1.3.3+ds-1_all.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "3e3ef129b4bf61513144236e15e1b4ec57fa5ae3dc8a72137abdbefb7a63af85"
  end

  resource "libtirpc-dev" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc-dev_1.3.3+ds-1_ppc64el.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "eeb86867a4331e9a498a732edd07b3b3960e57192908b8e39fe0d277cf630c0d"
  end

  resource "libtirpc3" do
    url "http://deb.debian.org/debian/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_ppc64el.deb"
    version "1.3.3+ds-1-ksr"
    sha256 "7e7f9e331911461bac1658fde467fda885573d6e1e3eb5ca683c30753096fa69"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libtsan2_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "51ebf91b4607d478403f5752414b6053df84dace3c68f97e68a149728cb60ca5"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-12/libubsan1_12.2.0-14_ppc64el.deb"
    version "12.2.0-14-ksr"
    sha256 "52aa16dc56388e57f7bd47fcd4d38519f0d6b1d7ea68ed52a6b3f0c023744ec6"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.1.115-1_ppc64el.deb"
    version "6.1.115-1-ksr"
    sha256 "900e010335f336003a03bc9ddb63ec0e8ac09bf73621a8f4ee92a61ddd2f14a2"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_ppc64el.deb"
    version "1.4.3-1-ksr"
    sha256 "6478fe8b42b7566f6569178d1e50a4f102ce7739e8653d3bcf5a78096bf8d6f8"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-linux-gnu KSYSROOT_FULL_TRIPLE=powerpc64le-linux6.1-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=12
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=ppc64 MESON_CPU=ppc64 MESON_ENDIAN=little
      # DEBIAN_VERSION=12 DEBIAN_NAME=bookworm DEBIAN_GCC=12
      # DEBIAN_ARCH=ppc64el LINUX_VERSION=6.1
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
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
      assert_equal "-lcrypt", shell_output("#{bin}/powerpc64le-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/powerpc64le-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
