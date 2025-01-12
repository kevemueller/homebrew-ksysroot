class KsysrootX8664Dragonflybsd < Formula
  desc "Sysroot for x86_64-dragonflybsd6.4@DragonFlyBSD6.4"
  homepage "https://github.com/kevemueller/ksysroot"
  url "https://github.com/kevemueller/ksysroot/archive/refs/tags/v0.8.tar.gz"
  sha256 "7be9578afc0ec7d47874ee8bc6d3457f1b703241a1ff47dbd3906f88b5200f6a"
  license "BSD-3-Clause"
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
  on_linux do
    disable! date: "2024-01-01", because: "Unwanted system libraries"
  end

  resource "dfly-x86_64-6.4.0_REL.iso.bz2" do
    url "https://avalon.dragonflybsd.org/iso-images/dfly-x86_64-6.4.0_REL.iso.bz2"
    version "6.4-ksr"
    sha256 "c213cc20ba1284efafe017c16db1974c154728e2e757c649af91d0e2a246a0dd"
  end

  def install
    cachedir=ENV.fetch("HOMEBREW_CACHE")
    ENV["CACHE_DIR"]=cachedir
    ENV["LLVM_DIR"]=Formula["llvm"].bin
    ENV["LLD_DIR"]=Formula["lld"].bin
    ENV["PKG_CONFIG"]="#{Formula["pkgconf"].bin}/pkg-config"
    bom = <<~EOS
      # KSYSROOT_TRIPLE=x86_64-dragonflybsd6.4 KSYSROOT_FULL_TRIPLE=x86_64-dragonflybsd6.4
      # KSYSROOT_OSFLAVOUR=DragonFlyBSD KSYSROOT_OSRELEASE=6.4
      # KSYSROOT_LINKER=ld.lld
      # KSYSROOT_LICENSE=BSD-3-Clause
      # MESON_SYSTEM=dragonfly MESON_CPUFAMILY=x86_64 MESON_CPU=x86_64 MESON_ENDIAN=little
      # DFLYBSD_VERSION=6.4 DFLYBSD_KERNEL=6.4
    EOS
    bom << resources.map { |r|
      "#{r.name} #{r.version.to_s.delete_suffix("-ksr")} #{r.url} " \
        "#{r.cached_download.relative_path_from(cachedir)} #{r.checksum}"
    }.join("\n")
    bom << "\n"
    File.write("bom.in", bom)
    link_triple="x86_64-dragonflybsd"
    system "./ksysroot.sh", "frombom", prefix, "bom.in", link_triple
    rm prefix/"native.txt"
    meson_cross = share/"meson/cross"
    mkdir meson_cross
    meson_cross.install prefix/"cross.txt" => "x86_64-dragonflybsd6.4"
    meson_cross.install_symlink meson_cross/"x86_64-dragonflybsd6.4" => link_triple unless link_triple.empty?
  end
end
