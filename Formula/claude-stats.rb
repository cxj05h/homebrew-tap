class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.2/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "3f851e32625ea86c7aeebf0a6660a88035b9085f4626a7f5fab86dae35c2e334"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.2/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "c798262add3f1ccba236c59cb9d0c3b3bff36e8269be8adcee67b1a4479a8bc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.2/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a1f48ff2544ecc8780683731d33cfe28712d1496491ecdae1c16eb6cd5d294a"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.2/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05c23eed2c3331079c33bd739426a5d5a3d1ee11716f803a8619c26369ccda73"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
