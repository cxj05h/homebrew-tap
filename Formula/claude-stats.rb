class ClaudeStats < Formula
  desc "Terminal dashboard for Claude Code usage — session browser, token stats, chat history"
  homepage "https://github.com/cxj05h/claude-stats"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.0/claude-stats-aarch64-apple-darwin.tar.gz"
      sha256 "ee07fefeab82938768ee73565b5c966d5ef91e22bdff86726556e209d7820db4"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.0/claude-stats-x86_64-apple-darwin.tar.gz"
      sha256 "ec738c49f6b44fcd43bb59f649d12b4a9217f937a570878eaefafef0e1dc541d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.0/claude-stats-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77a6085c157794fe5dc96fe46fc976430f41964dea85fa30418b3b9fea630e40"
    else
      url "https://github.com/cxj05h/claude-stats/releases/download/v0.4.0/claude-stats-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5050e39ffaa61f1cbaed98fb28d777ae6a9d794da5ed12eb47f51b291ef49f7"
    end
  end

  def install
    bin.install "claude-stats"
  end

  test do
    assert_predicate bin/"claude-stats", :exist?
  end
end
