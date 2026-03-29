class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.2/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "733bc68502dcdc40963db5f28f62ee4723e50ba6deb03c9c09f7cce65c0f0943"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.2/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "3a506ad84cbcf319f1c71da90012883762c74ff4fa76bbde41a96d6f9e189de5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.2/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e98aa2008fe278d2dcb6bc2605914f48533b934207d59547b72ebc99888001d"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.2/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fa87a5e9c39236be96deaa560e8bf7fa2e1c448c001b5791c2f900b509d6cae"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
