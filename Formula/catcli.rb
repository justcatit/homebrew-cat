class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.0.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-osx-arm64.tar.gz"
      sha256 "a71dac42134680ba72fac8a622a042de721034657688c7c41504e848df194dd3"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-osx-x64.tar.gz"
      sha256 "68ed6ae8bdd47b50b6d6a3ea588a3d4293f6449c5c9b92d3a22464e58e27b2ba"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-linux-arm64.tar.gz"
      sha256 "1b327502613e5e7e64e17b8c23ec41bb609922d314968422ca100a7f1b915bd7"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-linux-x64.tar.gz"
      sha256 "b3bc7e2dcced6c8c1b7c3b62e5042916036e6e0af7b205f69ff6f5a1fe295978"
    end
  end

  def install
    # catcli, its native libraries and Assets/ must stay together: the bundled project
    # templates are located relative to the executable's own directory.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"catcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/catcli --version")
  end
end
