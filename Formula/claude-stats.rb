class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.3/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "86221f1dba2233541bb687904e1634a0472ee3922bac268eb678262f6f87c27d"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.3/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "8662ffc1015b97305bb20e998fb44c238834d6338abd72906308e91befa37051"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.3/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ead51ef26745adff3b1e5fb67c56376f60df94e0dac51af538ad95ad778a2244"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.3/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc97bee6f23b251041cf90204621f64cd587ed8355626ebfccf8bccc0fd268e4"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
