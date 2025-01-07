class KsysrootAarch64Freebsd141AT141FreebsdRelease < Formula
  desc "Sysroot for aarch64-freebsd14.1@freebsd14.1-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "023d15752c0908cabd9630b5356ec7d49f5890a5b5411157c4114c3b866cec7c"
  license "BSD-2-Clause"
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

  resource "base.txz" do
    url "https://download.freebsd.org/releases/arm64/aarch64/14.1-RELEASE/base.txz"
    version "14.1-RELEASE-ksr"
    sha256 "b25830252e0dce0161004a5b69a159cbbd92d5e92ae362b06158dbb3f2568d32"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=aarch64-freebsd14.1 KSYSROOT_FULL_TRIPLE=aarch64-freebsd14.1
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=14.1-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=aarch64 MESON_CPU=aarch64 MESON_ENDIAN=little
      # FREEBSD_VERSION=14.1-RELEASE FREEBSD_KERNEL=14.1 FREEBSD_MACHINE=arm64 FREEBSD_MACHINE_ARCH=aarch64
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    ohai "bom=#{bom}"
    File.write("bom.in", bom)
    link_triple=""
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "aarch64-freebsd14.1"
    meson_cross.install_symlink meson_cross/"aarch64-freebsd14.1" => link_triple unless link_triple.empty?
  end
  test do
    resource "testcases" do
      url KsysrootAarch64Freebsd141AT141FreebsdRelease.stable.url
      sha256 KsysrootAarch64Freebsd141AT141FreebsdRelease.stable.checksum.hexdigest
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
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             "--cross-file=aarch64-freebsd14.1", testpath/"build-c", "test-c"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-c"
      assert_predicate testpath/"build-c/main", :exist?

      # build a C++ library + program with meson
      system Formula["meson"].bin/"meson", "setup", "--native-file=ksysroot",
             "--cross-file=aarch64-freebsd14.1", testpath/"build-cxx", "test-cxx"
      system Formula["meson"].bin/"meson", "compile", "-C", testpath/"build-cxx"
      assert_predicate testpath/"build-cxx/main", :exist?
      # check pkg-config personality is properly set-up
      assert_equal "-lcrypto", shell_output("#{bin}/aarch64-freebsd14.1-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/aarch64-freebsd14.1-pkg-config --cflags libcrypto").strip
    end
  end
end
