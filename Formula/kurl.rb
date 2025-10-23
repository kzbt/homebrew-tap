class Kurl < Formula
  desc "Lightweight CLI tool to parse and output URL components in plain text or JSON"
  homepage "https://github.com/kzbt/kurl"
  url "https://github.com/kzbt/kurl/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c007aff8e23afa75d146f35b92b7f72f8348b4f35903feb7a7e4a00dbaca8d7c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal '{"scheme":"file","path":"/"}', shell_output("#{bin}/kurl --json file:///").chomp
  end
end
