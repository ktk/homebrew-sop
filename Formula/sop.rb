class Sop < Formula
  desc "Swiss-army knife for processing RDF and Linked Data on the command line"
  homepage "https://github.com/pchampin/sophia-cli"
  head "https://github.com/pchampin/sophia-cli.git", branch: "main"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Check that the version output starts with "sop "
    assert_match /^sop /, shell_output("#{bin}/sop --version")

    # Additional basic functionality test
    (testpath/"input.ttl").write("@prefix ex: <http://example.com/> .\nex:s a ex:Class .")
    output = shell_output("#{bin}/sop parse #{testpath}/input.ttl")
    assert_match "ex:Class", output
  end
end
