class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-osx-arm64.tar.gz"
      sha256 "5f11a8dee29e92bc63073b14ae57329c9d493e9fcb551b29d41b7d984ad72a4f"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-osx-x64.tar.gz"
      sha256 "2451d52d3dc1211cb7b94d3c9013987520e3a6747fa8a36663407c73fbdf548f"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-linux-arm64.tar.gz"
      sha256 "f7157c81bf0b3ac513ae95ceaf83ce8d984999470c16c70632a923a6a3a5e3b5"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-linux-x64.tar.gz"
      sha256 "e50be01154b88aeb35e36dfc006d1e90a314ef82f7855e2b1dbea4273f8bf7af"
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
