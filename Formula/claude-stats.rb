class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.2/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "2ba3f7676f18c9a395010bde79d3de7f70423bde3f68f35d863337cace80e542"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.2/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "3151e93fc758ec92dca9ad0256fb4fbf6d8a79986414d0b524be2afe70f6aa02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.2/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a1d476dceeab0b36fedc031c9cfd3dbe4e64ed9eb29626a57c0a767a69597a7"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.2/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c8ae56447682ace2c1f55fb5e076b4a974a0aba84c269781f745ce3009d68dd"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
