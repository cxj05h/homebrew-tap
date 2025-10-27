# In your cask formula file (e.g., Casks/sql-maestro.rb):

require_relative "../lib/github_private_repo_strategy.rb"

cask "sql-maestro" do
  version "1.9.7"
  sha256 "68cfa3d1648ceaa3702b1ca7d43bf9cab6841de0644e3e60a437c163af0ea05f"
  
  url "https://github.com/cxj05h/SQL-Maestro/releases/download/v#{version}/SQLMaestro-v#{version}.zip",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy

  name "SQL Maestro"
  desc "SQL template manager for database troubleshooting"
  homepage "https://github.com/cxj05h/SQL-Maestro"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "SQLMaestro.app"

  zap trash: [
    "~/Library/Application Support/SQLMaestro",
    "~/Library/Preferences/com.sqlmaestro.SQLMaestro.plist",
  ]
end
