class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.1.0-dev"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-dev-osx-arm64.tar.gz"
      sha256 "39fd4565dc815b7fd2d39c79d1f5ac5733e3eb3cde726e5b3e0b9c3d70230f7c"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-dev-osx-x64.tar.gz"
      sha256 "1e6f70a9af099f65026baf0ed1e279dcee87f613223425dadabcd7b85215637f"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-dev-linux-arm64.tar.gz"
      sha256 "66dc3fb769eb98f8b943eba140fd334299c246b5d1ff285f9c204284e02f59b3"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.1.0-dev-linux-x64.tar.gz"
      sha256 "96046c5d60a7614cf285c98b0746954386e6e43648b480fc8bba27a6aa38260c"
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
