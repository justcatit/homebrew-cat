class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.0.0-dev"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-osx-arm64.tar.gz"
      sha256 "a45f6d01f8f26257001d9bad82dd0a09276bb5504a68bedee579ea626a591971"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-osx-x64.tar.gz"
      sha256 "8490a5fae7c28fb23f1e21106b94efff8a8e4a83fbe191b8b07ef61993488ba1"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-linux-arm64.tar.gz"
      sha256 "5890235db38db0ae5f75cd40594379bbf6e1318af5153283f9ba2eebc5abf63a"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-linux-x64.tar.gz"
      sha256 "26792b0f6ec93f7c57486ea2862faece9b2b966d3c4f57e10fa0e43c12aba3cb"
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
