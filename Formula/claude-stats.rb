class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "076a927402850575e69592ed91c5b1cc21e64a1f57848265bd5d72aafe210a1c"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "e2579a7bcab06f812fe12e94b3ad4038ec2f085bc1b0b414e58649a2f1d81930"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ff354b7604c31790c0bfcd4fe361ece1c9b5aa056b40a0a248b26e10d473a58"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.8.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dedff9d5b4dff74e7125364b7731db4234f9e2cd7210b079fb29c43f26bf7b0"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
