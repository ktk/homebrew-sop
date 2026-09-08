class Sop < Formula
  desc "Swiss-army knife for processing RDF and Linked Data on the command-line"
  homepage "https://github.com/pchampin/sophia-cli"
  version "0.1.0-alpha1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha1/sop-aarch64-apple-darwin.tar.gz"
      sha256 "a7ae1ee00bd91fe5a4d03af3ddf8f14799bfceee1c2c511096976558d4d7415b"
    end
    on_intel do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha1/sop-x86_64-apple-darwin.tar.gz"
      sha256 "d32acfcfb96f803bab59bbb7e503b471ab4f124d44b192957cd712eb5d78efe0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha1/sop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c594123af98447ce59ccd7e63570cad031666dc212db7248e11330aae45af5a"
    end
  end

  def install
    bin.install "sop"
  end

  test do
    # Check that the version output starts with "sophia-cli "
    assert_match(/^sophia-cli /, shell_output("#{bin}/sop --version"))

    # Additional basic functionality test
    (testpath/"input.ttl").write("@prefix ex: <http://example.com/> .\nex:s a ex:Class .")
    output = shell_output("#{bin}/sop parse #{testpath}/input.ttl")
    assert_match "http://example.com/Class", output
  end
end
