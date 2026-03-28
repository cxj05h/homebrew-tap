class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "f7894d567f3b2e7db9230153bf84ae858b8cf4e7d3958a53af9296dcd779ff66"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "44049bf57ad2aa5a57bf34880fbd76ee21497c5468d9e4ccfcaa129fbe8d5d8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adefdc3dbb2820615e865fc3585f64386c3157d42005d32813c0817dc9e2ba87"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f047964f546516d3365ede6cfd41f67ad46ff810facd9b6b3729aa6ed4b46d8"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
