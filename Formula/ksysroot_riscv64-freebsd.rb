class KsysrootRiscv64Freebsd < Formula
  desc "Sysroot for riscv64-freebsd14.2@freebsd14.2-RELEASE"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "b8d0954e9d71aa5b10f2d41b4279287cb235d7dbcfc0bc431ffaa98034c4d884"
  license "BSD-2-Clause"
  head "https://github.com/kevemueller/ksysroot.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kevemueller/ksysroot"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f361b8dbdae1d7f6b4993d1542f5fbe45e458154c5f981e189c9180c83d70626"
    sha256 cellar: :any_skip_relocation, ventura:       "4ad319b6488deb9fd5cc9e050401dc68d5efb1f5b12b4e5f04e1868be4060a4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ed94e47fd06bf490ffde8395bc406e4a14cb1d33dd91b49a290049fb0697efa1"
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
    url "https://download.freebsd.org/releases/riscv/riscv64/14.2-RELEASE/base.txz"
    version "14.2-RELEASE-ksr"
    sha256 "a5fbf6b607f73b0209f24921cba68f3d111fdbb8627b1c0145766caedbcaa9c8"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=riscv64-freebsd14.2 KSYSROOT_FULL_TRIPLE=riscv64-freebsd14.2
      # KSYSROOT_OSFLAVOUR=freebsd KSYSROOT_OSRELEASE=14.2-RELEASE
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-2-Clause
      # MESON_SYSTEM=freebsd MESON_CPUFAMILY=riscv64 MESON_CPU=riscv64 MESON_ENDIAN=little
      # FREEBSD_VERSION=14.2-RELEASE FREEBSD_MACHINE=riscv FREEBSD_MACHINE_ARCH=riscv64
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
      url KsysrootRiscv64Freebsd.stable.url
      sha256 KsysrootRiscv64Freebsd.stable.checksum.hexdigest
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
      assert_equal "-lcrypto", shell_output("#{bin}/riscv64-freebsd14.2-pkg-config --libs libcrypto").strip
      assert_equal "", shell_output("#{bin}/riscv64-freebsd14.2-pkg-config --cflags libcrypto").strip
    end
  end
end
