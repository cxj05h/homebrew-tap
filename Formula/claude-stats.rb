class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.2/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "d342f88c57c4f0e2410c4a6f9c3cb646e9c9282c27eb3f5fdee6754a4c7bf10b"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.2/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "ef42c2700fe60398a19ca4279051bd4fb0da9180ec9a7f4c832cdc58ba739f0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.2/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d503351c21c9dc785b5a4589c1a3b592ccca1657f863474695913cf19189d68"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.2/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1f1a8edd84d95d06a321e37a97d9e410f3cd93418cbab9553ca757f980d6c78"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
