class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.2.1-osx-arm64.tar.gz"
      sha256 "43e8c8bcebaac268559c870998579bcd254ca1444b6223e276fd9a6290f861ad"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.2.1-osx-x64.tar.gz"
      sha256 "dec0dc4143f59f10dc851cca1cfbf6989dad15a76f792a89fd70af8ff5dd3a59"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.2.1-linux-arm64.tar.gz"
      sha256 "d2e4a4f4fec127bbffa9e0bdc2ef811a52b9ae7f290c457bf0810b691f2ff609"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.2.1-linux-x64.tar.gz"
      sha256 "121d84db49b5ea3da681fd7c8ee1f4830a0656845cfea2cf69aca7eef432bc70"
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
