cask "sql-maestro" do
  version "1.9.1"
  #revision 1
  sha256 "ce5d0755f3cc5338a3af87a7b7ff4cac68eecf6b1d4cdfcdb2d1bcb77a032458"

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

