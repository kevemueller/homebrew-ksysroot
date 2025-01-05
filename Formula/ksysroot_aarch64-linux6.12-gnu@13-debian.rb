class KsysrootAarch64Linux612GnuAT13Debian < Formula
  desc "Sysroot for aarch64-linux-gnu@debian13"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "144a1024ab6b971fd6f3d63f03906b7c25bd22e52d4780365e6b70888bfd0918"
  license "GPL-2.0-or-later"
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

  resource "gcc-14-base" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/gcc-14-base_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "4e27267a200edbc10776af2485e7346e6df49e9eafecf7e213557d2e9b331a3e"
  end

  resource "libasan8" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libasan8_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "a7dca4d324bd81cf28d8f6a9e2600a6956d8a77c010e2b4cf170ae02ff6ab79e"
  end

  resource "libatomic1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libatomic1_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "d03c77f6123c554cc9e803c16903c46fbf78c4e3c2e5817898a9db1ed02927bb"
  end

  resource "libc-dev-bin" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc-dev-bin_2.40-4_arm64.deb"
    version "2.40-4-ksr"
    sha256 "e041145d10f67e0cc3f03b96d49a4f72aab59d8f940d34a95234d05f8faf2d1a"
  end

  resource "libc6" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6_2.40-4_arm64.deb"
    version "2.40-4-ksr"
    sha256 "dd67788a5f04468b6c46a942f6f32625cae5f16c1c78f876569243238028f3fc"
  end

  resource "libc6-dev" do
    url "http://deb.debian.org/debian/pool/main/g/glibc/libc6-dev_2.40-4_arm64.deb"
    version "2.40-4-ksr"
    sha256 "740a526f7776d9bebf9af92ef3cb3a865ab495c8601c23fb563f1d245fab2ca1"
  end

  resource "libcrypt-dev" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt-dev_4.4.36-5_arm64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "30621cfd1d87c9116fcde9fd4779f8e99e4d4e5e39ebc60a36e166397591da14"
  end

  resource "libcrypt1" do
    url "http://deb.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.36-5_arm64.deb"
    version "1:4.4.36-5-ksr"
    sha256 "87ed379a72a42a6bf1d21abc5e4a38da0ff5b76ba6143705931a88c6abf9b082"
  end

  resource "libgcc-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-14-dev_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "fa037240130df2e4b86b6f97aa3b5dad918d17836cd4f6acc18fd972d1914bde"
  end

  resource "libgcc-s1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgcc-s1_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "6445712bdaaba59c1e130e1d6afbfc5fcd1e261dec4c353169525550b26a0e34"
  end

  resource "libgomp1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libgomp1_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "d70a577663e390964dd6b618e3de34d0a99aeb1d6d39673e6615de3fb1cf0d6d"
  end

  resource "libhwasan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libhwasan0_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "d5ae3bd37c703ecd6aa7e16a1d2a8b1bfd3a7147ff73afffcf3d9cb7ee72da3a"
  end

  resource "libitm1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libitm1_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "9ccafabcda8bf89da4c13f818c97566d205a0f985c8f8e1893918c907829b6d6"
  end

  resource "liblsan0" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/liblsan0_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "5b33af12b7aa1986193f98b3f1c472c876aa10b690a8cfdf6c9abead40bbb572"
  end

  resource "libstdc++-14-dev" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++-14-dev_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "6c315aeabbf9b379185a8a29131a88f6a0784f799b465f3c88a71cd1f31da97b"
  end

  resource "libstdc++6" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libstdc++6_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "302e35067f9b2bdc9991c1cbdcec1ec5a2ea2ef56ae6e9538bbaafff784f1ec0"
  end

  resource "libtsan2" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libtsan2_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "8d5770e382a95d11cab27b0807993f2f5f778b3f91b6f497f8647e5fa6be28f1"
  end

  resource "libubsan1" do
    url "http://deb.debian.org/debian/pool/main/g/gcc-14/libubsan1_14.2.0-8_arm64.deb"
    version "14.2.0-8-ksr"
    sha256 "868bfd970f4478d55bbbb4995bb7f60d25e303473b68cf043df480cff199d778"
  end

  resource "linux-libc-dev" do
    url "http://deb.debian.org/debian/pool/main/l/linux/linux-libc-dev_6.12.6-1_all.deb"
    version "6.12.6-1-ksr"
    sha256 "4bf6702ef24dec9cc3ce606d5e9180ac7270a9dca181813a9fa68cfeb31b70ff"
  end

  resource "rpcsvc-proto" do
    url "http://deb.debian.org/debian/pool/main/r/rpcsvc-proto/rpcsvc-proto_1.4.3-1+b1_arm64.deb"
    version "1.4.3-1+b1-ksr"
    sha256 "6ae3c216e6c7d8e042ad3f122b8aa89aff56b2b5174b1c5780a7841b3becd61c"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-linux-gnu KSYSROOT_FULL_TRIPLE=aarch64-linux6.12-gnu
      # KSYSROOT_OSFLAVOUR=debian KSYSROOT_OSRELEASE=13
      # KSYSROOT_LINKER=ld.lld
      # MESON_SYSTEM=linux MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # DEBIAN_VERSION=13 DEBIAN_NAME=trixie DEBIAN_GCC=14
      # DEBIAN_ARCH=arm64 LINUX_VERSION=6.12
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
      url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.3.tar.gz"
      sha256 "144a1024ab6b971fd6f3d63f03906b7c25bd22e52d4780365e6b70888bfd0918"
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
      assert_equal "-lcrypt", shell_output("#{bin}/aarch64-linux-gnu-pkg-config --libs libcrypt").strip
      assert_equal "", shell_output("#{bin}/aarch64-linux-gnu-pkg-config --cflags libcrypt").strip
    end
  end
end
