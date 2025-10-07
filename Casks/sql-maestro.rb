cask "sql-maestro" do
  version "1.5.8"
  #revision 1
  sha256 "7e612ec9dd5d92de384ac509b5ad854caa74544293e30f15ba41cd2757119449"

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


