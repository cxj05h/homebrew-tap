class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v#{version}/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "e6406fefbc3d9512b5ce8ba7c251389d22e630e94dd9b8d9af0cb12ade6811d4"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v#{version}/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "b4a44679afacfc886a9db8c0248a7903556a02a6f176ba1f29328eb658b9c28e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v#{version}/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91bff8fc3db31ec1a81cfeb5a19e3af2b114f8efea771894a03d1e72b3ac5f20"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v#{version}/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db8a755fdd3eb6ef96b42b1be4588f7bc7994fdbc68dda9c35253e996b7896ea"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
