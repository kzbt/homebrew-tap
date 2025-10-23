class Kurl < Formula
  desc "Lightweight CLI tool to parse and output URL components in plain text or JSON"
  homepage "https://github.com/kzbt/kurl"
  url "https://github.com/kzbt/kurl/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c007aff8e23afa75d146f35b92b7f72f8348b4f35903feb7a7e4a00dbaca8d7c"
  license "MIT"

  bottle do
    root_url "https://github.com/kzbt/homebrew-tap/releases/download/kurl-0.1.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bb6407ab5a7cb7fe33586f006c27550daa611ff3ee5c6fd9a5bc81fb5cd86119"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b9ce792ffc148608e52f401c8b154fcec10c08be9b19731433ad2739fab09c7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal '{"scheme":"file","path":"/"}', shell_output("#{bin}/kurl --json file:///").chomp
  end
end
