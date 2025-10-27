# In your cask formula file (e.g., Casks/sql-maestro.rb):

require_relative "../lib/github_private_repo_strategy"

cask "sql-maestro" do
  version "1.9.6"
  sha256 "8a62084b07235a8ede053c27a49f68efb1bf5433e1494ab893b389f4a20e232e"
  
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
