class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.0/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "029afc071ce6b45810322b547714a25b5b346cd8fcc0c10dc42ddfe311afd99f"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.0/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "a7bc5fb225f9dc900a765afbb0b0a07351d7f14deb1fce1f3c24e435739a73dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.0/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e30836382aae8d99180a8e364591e661ee53fba5e6a60d095a7b9b347608bc1c"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.0/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cc73f8eb168ef7955a615b023bacd2bf3e11a8428d4c58f1061f3a69f8ce398"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
