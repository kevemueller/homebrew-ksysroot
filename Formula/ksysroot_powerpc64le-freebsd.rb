class KsysrootPowerpc64leFreebsd < Formula
  desc "Sysroot for powerpc64le-freebsd14.2@freebsd14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "65fd63f8559a97da562f29db727d6cbafb6d234f1e25cee1d718e350348f71b3"
    sha256 cellar: :any_skip_relocation, ventura:       "b73870d3223818365bc36a733a87c10284a80b6a0f39f3f1a03e683f8d71d66a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f7c40fb9a45893d0ca80f7970d0346937e22a9f206a4df25bdf0230f70700f20"
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

  resource "base.txz" do
    url "https://download.freebsd.org/releases/powerpc/powerpc64le/14.2-RELEASE/base.txz"
    version "14.2-RELEASE-ksr"
    sha256 "2de95a1e5bc074af5073afa9b047622347fe51cd3886432b04a13fd9c26f7030"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=powerpc64le-freebsd14.2 KSYSROOT_FULL_TRIPLE=powerpc64le-freebsd14.2
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=14.2-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=ppc64 MESON_CPU=ppc64 MESON_ENDIAN=little
      # FREEBSD_VERSION=14.2-RELEASE FREEBSD_MACHINE=powerpc FREEBSD_MACHINE_ARCH=powerpc64le
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
      url KsysrootPowerpc64leFreebsd.stable.url
      sha256 KsysrootPowerpc64leFreebsd.stable.checksum.hexdigest
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
      assert_equal "-lcrypto", shell_output("#{bin}/powerpc64le-freebsd14.2-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/powerpc64le-freebsd14.2-pkg-config --cflags libcrypto").strip
    end
  end
end
