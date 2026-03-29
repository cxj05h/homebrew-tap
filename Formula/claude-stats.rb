class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "f8f09caf4bcf0fde507d0ee5842fa11f0ef3bce19d41860b9931aaac6b85a205"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "f1f2b408a04118e39d734689c5eea33f2e6e55ac427771031c7f8fa049311a34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c892087c5c47ee9662f99fb2fb24e52d013ae42741e8e3f0c712860b2a0aaa6"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "481497bddecf0d5d9e9d792db19edde1314906beec1208d57bfd5762fc0eb7e5"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
