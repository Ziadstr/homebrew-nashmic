class Nashmic < Formula
  desc "The first Franco-Arab programming language — transpiles to C"
  homepage "https://github.com/Ziadstr/nashmic"
  url "https://github.com/Ziadstr/nashmic/archive/refs/tags/v0.1.0-alpha.tar.gz"
  sha256 "da316b69ecd25c567aabfd4643a944aa916d2954896600b7d02c8f26e7472c13"
  license "MIT"
  head "https://github.com/Ziadstr/nashmic.git", branch: "main"

  depends_on "readline"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.nsh").write('dalle yalla() { itba3("marhaba!\n") }')
    assert_match "marhaba!", shell_output("#{bin}/mansaf run #{testpath}/test.nsh")
  end
end
