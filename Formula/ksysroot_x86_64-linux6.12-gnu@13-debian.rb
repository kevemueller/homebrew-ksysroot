class KsysrootX8664Linux612GnuAT13Debian < Formula
  desc "Sysroot for x86_64-linux-gnu@debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  keg_only :versioned_formula
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

  resource "gcc-14-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "b0b1703f05020711dd37670bac04ef36184c14f779ba5829bb90d2df8cb635ed"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "49b055aa547d898394e689973c15fdc5c327849a760f39e835686f89ab5dcefa"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "a491563625db5fda1b57633ee1a65bb04730244e1918413f72dd165b19af4543"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-4_amd64.deb"
    version "2.40-4-ksr"
    sha256 "22281100ed2978dbe8f6572708648fe30969321f421bd84cecb684fc19ed80e7"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-4_amd64.deb"
    version "2.40-4-ksr"
    sha256 "44bc6c9b94ef706a3979f90afabd1ab4b182092e662c4e93b3384cc0f2bf2fbb"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-4_amd64.deb"
    version "2.40-4-ksr"
    sha256 "4a5ef780e3b8fc5a6ea9b3db15679ef2b56308a2cbef1ca3daf1df825d13e555"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_amd64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "6db83379e5f09d34278e36aea0aee88f483eca92f315c73b5e4be5289c8c8d38"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_amd64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "64d5c58fe7d8eaa7edac8a3b6f4783ab50580b53eca8c79becbb0459e2942a31"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "20efd7aca6fc7e47729a5f0b566244fb6c99c4cc4041ed7af36ec552e2ed6673"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "f9656fc102c9e8adc080c74ecb8dd87950874cc79601b33f6015ff608ef2d76c"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "d527a5cf43cc4529f1de1d4b17e9ed57b293ef010e075463b275b5de14fc92ac"
  end

  resource "libhwasan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libhwasan0_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "cd9a78e1b1d618fafd2e070b1a286b0ac749c8dd7db6370f9d27479ec5c855a1"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "5dc8afe5a4a4b397ff65802664daee0387e19b11385d479acd41a02d22acb7b1"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "239074a0518145b9df336d519b952a6d1eeb6d3b4e7cca93b325c1308a011d24"
  end

  resource "libquadmath0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libquadmath0_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "30f75eb4dba2e4a10e029924e4eeb0c9f6d2b91c6748cc0c0a958b36a75dccc8"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "3129d4a608904881b5ffc10669b66a2107872c516a2eb6cc08b6cf3d47ee9142"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "5f1ad4ab9fbf2a7dd1f4a4f237bf843343823f4bc9491dd1d395ef780b2793d0"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "24d39957354c7fd5dd32e87c77a6bc1f78bf5bdc0b3f66e0458e77b2a2f93aea"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-8_amd64.deb"
    version "14.2.0-8-ksr"
    sha256 "ac32fe2d41aa65ce36ad9f7a011cce7ba896faac13ded1a641c7664758999084"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1_amd64.deb"
    version "1.4.3-1-ksr"
    sha256 "32ac0692694f8a34cc90c895f4fc739680fb2ef0e2d4870a68833682bf1c81a3"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-linux-gnu KSYSROOT_FULL_TRIPLE=x86_64-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=GPL-2.0-or-later
      # MESON_SYSTEM=linux MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=amd64 LINUX_VERSION=6.12
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
      url KsysrootX8664Linux612GnuAT13Debian.stable.url
      sha256 KsysrootX8664Linux612GnuAT13Debian.stable.checksum.hexdigest
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
      # build a C library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=#{prefix}/native.txt",
             "--cross-file=#{prefix}/cross.txt", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypt", shell_output("#{bin}/x86_64-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/x86_64-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
