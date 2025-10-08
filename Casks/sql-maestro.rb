cask "sql-maestro" do
  version "1.6.4"
  #revision 1
  sha256 "93a1368bcf2fd47149ba0066f0fa4b33f11e0aab8ec58d8aa6485b0a6b8b79a3"

  url "https://github.com/cxj05h/SQL-Maestro/releases/download/v#{version}/SQLMaestro-v#{version}.zip"
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


