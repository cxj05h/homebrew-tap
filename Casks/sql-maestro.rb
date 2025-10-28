require "download_strategy"
require "open-uri"
require "json"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless token

    # Get the tag name from the URL (e.g., "v1.9.7")
    tag = @url.to_s.sub(/^.*\/([^\/]+)$/, '\1') if @url.include?("/")
    tag ||= @url.to_s
    asset_name = "SQLMaestro-#{tag}.zip"

    # Fetch the release metadata from GitHub API
    release_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/tags/#{tag}"
    release_json = URI.open(release_api,
      "Authorization" => "Bearer #{token}",
      "Accept" => "application/vnd.github+json"
    ).read
    asset = JSON.parse(release_json)["assets"].find { |a| a["name"] == asset_name }
    raise "Asset #{asset_name} not found in release!" unless asset
    asset_id = asset["id"]

    # Download the release asset using its ID
    asset_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/assets/#{asset_id}"

    # Use Homebrew's expected file path (temporary_path) for the download
    output_path = cached_location || temporary_path

    system "curl", "-L",
      "-H", "Authorization: Bearer #{token}",
      "-H", "Accept: application/octet-stream",
      "--output", output_path,
      asset_api

    raise "Download failed!" unless File.exist?(output_path)
  end
end

cask "sql-maestro" do
  version "2.0.1"
  sha256 "88db700835b94d929a832971ae63552c5a8f414e186804c24eba5d7028ab9531"
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
