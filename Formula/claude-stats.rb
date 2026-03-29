class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.0/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "899a985a24590ac2d61c1337fe02e5256ba2e89c93cabc9563c4bf59bc2c7f85"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.0/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "c3c8df56686932ba54e320354e68e26f9ad28d59f6ffbb130b6cb2ae5b1ef119"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.0/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2251e916492ac2ac5f64b0cb707d06edfd85716c97eff0c460b167889c6a3a1e"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.6.0/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dbaa0925ede53ea86418d9ad93c0f098b2b61e79bfc808bedab8db947cf1026"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
