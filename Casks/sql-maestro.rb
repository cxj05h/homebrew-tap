require_relative "../lib/github_private_repo_strategy"

cask "sql-maestro" do
  version "1.9.8"
  sha256 "edf33ab2da85e6de06bb3cea0867ea627afa47cf2e2b5c9cdd95007cd9214bd4"
  url "v#{version}", using: GitHubPrivateRepositoryReleaseDownloadStrategy
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
