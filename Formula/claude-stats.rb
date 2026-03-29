class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "3847cf66f0049b66d5e72ab97850b9412cd4ee1df0d89ba51c57e1d56af920e8"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "500e0b739071e764de1def4d155c98d71a760072346a46f9d7bdc4e4e0ab779d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d83db4992933880a2a2b5fb002ce36ca3ae356a0386bce16a37a972204ec1f0"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.7.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df48f9396d873827b9963add6c6af130518201f69793747689cf385c7176bd5e"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
