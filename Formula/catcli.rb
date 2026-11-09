class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.2.0-osx-arm64.tar.gz"
      sha256 "7ad512c2fd6c6b00ae2fee60d6a18d282277dd1506e00b3c1c86714ea44e76e2"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.2.0-osx-x64.tar.gz"
      sha256 "cedeb4a945a25bd2de949d76a797bf4ff034b2de5bcdc15cf03b5cf06a4b82cf"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.2.0-linux-arm64.tar.gz"
      sha256 "5cdfe17e88483b159b742edd095a9e375d98f4898379977f848c87e5f9402c23"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.2.0-linux-x64.tar.gz"
      sha256 "ef073f0c7b43eb5ba6d03880165ca7919cd469afa837f88215eab45dde303afd"
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
