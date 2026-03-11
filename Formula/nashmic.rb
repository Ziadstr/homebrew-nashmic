class Nashmic < Formula
  desc "The first Franco-Arab programming language -- transpiles to C"
  homepage "https://github.com/Ziadstr/nashmic"
  url "https://github.com/Ziadstr/nashmic/archive/refs/heads/main.tar.gz"
  version "0.2.0-dev"
  license "MIT"
  head "https://github.com/Ziadstr/nashmic.git", branch: "main"

  depends_on "readline"

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.nsh").write('yalla() { itba3("marhaba!\\n") }')
    assert_match "marhaba!", shell_output("#{bin}/mansaf run #{testpath}/test.nsh")
  end
end
