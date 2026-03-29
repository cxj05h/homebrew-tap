class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "53d8b5c4c43ef6d5492cc5c90b6fa2d6f2da5df8917fe5d769668d7f0eaf1a35"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "c6d44cf6aa18d39a7f9a6d6644efe5bc659d68604e05819c43f7b2f671f1398d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f780ffca4d7be2bc367b9b75cf5205d4579225fc528ee98f358446d413dd834"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97e1704b72ba0671938a47275f78ab83e45ecb9ae143ea54d5eb4e0451cb5cf3"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
