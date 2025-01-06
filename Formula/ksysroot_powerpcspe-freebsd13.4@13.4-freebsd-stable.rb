class KsysrootPowerpcspeFreebsd134AT134FreebsdStable < Formula
  desc "Sysroot for powerpcspe-freebsd13.4@freebsd13.4-STABLE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "BSD-2-Clause"
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

  resource "base.txz" do
    url "https://download.freebsd.org/snapshots/powerpc/powerpcspe/13.4-STABLE/base.txz"
    version "13.4-STABLE-ksr"
    sha256 "5ba32af0c1bf24435dddf4fe52593d211ac2bf243097744e25e769d5fbb518b5"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpcspe-freebsd13.4 KSYSROOT_FULL_TRIPLE=powerpcspe-freebsd13.4
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=13.4-STABLE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=ppc MESON_CPU=ppc MESON_ENDIAN=little
      # FREEBSD_VERSION=13.4-STABLE FREEBSD_MACHINE=powerpc FREEBSD_MACHINE_ARCH=powerpcspe
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
      url KsysrootPowerpcspeFreebsd134AT134FreebsdStable.stable.url
      sha256 KsysrootPowerpcspeFreebsd134AT134FreebsdStable.stable.checksum.hexdigest
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
      assert_equal "-lcrypto", shell_output("#{bin}/powerpcspe-freebsd13.4-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/powerpcspe-freebsd13.4-pkg-config --cflags libcrypto").strip
    end
  end
end
