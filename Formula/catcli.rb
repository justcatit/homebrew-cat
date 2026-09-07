class Catcli < Formula
  desc "CAT CLI - data tests from the command line"
  homepage "https://docs.justcat.it/"
  version "3.0.0-dev"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-osx-arm64.tar.gz"
      sha256 "7a4795bade8c686c3ac17c12f8fd64c5cc9c78ab5f48f08c2bf8dd901935e45f"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-osx-x64.tar.gz"
      sha256 "84f60c7e1102f4a63a1ae8080d6cd03ff191cc363e7f33eba97828bc35bec1ae"
    end
  end
  on_linux do
    on_arm do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-linux-arm64.tar.gz"
      sha256 "98875736ed8b6f41c8110b25d67d14c9cc6729cb01d3d73d0eb882736efc0200"
    end
    on_intel do
      url "https://docs.justcat.it/releases/cat-cli-3.0.0-dev-linux-x64.tar.gz"
      sha256 "a56b0d9ed66218785d598ad82993efc53bd0efdebc02eae21b9efda4d0270079"
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
