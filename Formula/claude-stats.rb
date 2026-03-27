class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.1/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "49eab06064ab06ccc38c3314533cd2ec7b99e964e3d7ea42a92cb23240b9fece"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.1/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "8837ed9e0152fcee3e5edd13be2fe9b5b5129f3b42dd1b1800356e71993a97b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.1/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2786470363d1be7785efd3ddd1709b558085af8cf9ce6e532fb5257773b7570c"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.3.1/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "159ea0931249d2c0ada2e849c4afb494464edb1da60f3a7a2dfb7ceccd1fa5ad"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
