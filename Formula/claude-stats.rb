class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.0/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "c9def1fc97ffb9de2732ae765821018af5a0950a9cf0957289ccf28280fe05ce"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.0/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "af7c11eac608a382fcc5abba73b35fa327d6c92b68fe69d4f41cea2d28febf26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.0/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "133785ce224c81bc8ef442693de580ea32f09eb8efb6594e12b1d8ef513edca9"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.0/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c59421585134aa56f95097050de1e71f20d0969907bf6e76a11b3cceb1908dd9"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
