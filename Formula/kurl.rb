class Kurl < Formula
  desc "A lightweight CLI tool to parse and output URL components in plain text or JSON"
  homepage "https://github.com/kzbt/kurl"
  url "https://github.com/kzbt/kurl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6a6d2d5299e8ab5406813dc5c4051018477834a8bd5b49e21e7fa00f11c69912"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal '{"scheme":"file","path":"/"}', shell_output("#{bin}/kurl --json file:///").chomp
  end
end
