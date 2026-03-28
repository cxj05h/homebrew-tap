class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.0/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "30fe08085f16f501753766bf5b21d34dc4bdd77281e9a71da87107018c09f077"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.0/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "f9abf6b425380864e703dac54f0f7636014bb88a1ced60ea6a71a18dd28cb442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.0/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b34fbb1099dfd8bf4e8e53d783a5c7cfa9b9c7907f84fea9f3c92b4a4dd5bc6"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.5.0/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e449b168afa6485587a2a2e738ed0598212449ede9f947c907fa34ef4f01e46"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
