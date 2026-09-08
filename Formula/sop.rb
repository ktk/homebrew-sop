class Sop < Formula
  desc "Swiss-army knife for processing RDF and Linked Data on the command-line"
  homepage "https://github.com/pchampin/sophia-cli"
  version "0.1.0-alpha2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha2/sop-aarch64-apple-darwin.tar.gz"
      sha256 "b3951e0f1c6e05c3d9506eb9a39c9973367ce3b00fbe684492044a154ff667c3"
    end
    on_intel do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha2/sop-x86_64-apple-darwin.tar.gz"
      sha256 "20be74ce0f8f329848e933fb8965bd84a19a360431357c9d3867bb02c377a2c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pchampin/sophia-cli/releases/download/v0.1.0-alpha2/sop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07db8dce067833553326ec026e0c565f672a5bf8066add1c7b0e39ce1a2f211d"
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
