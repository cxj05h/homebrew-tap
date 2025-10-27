require "download_strategy"
require "open-uri"
require "json"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless token

    # Extract version from url or formula var
    version = # your method to parse version/tag
    asset_name = "SQLMaestro-v#{version}.zip"

    # Fetch release info
    release_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/tags/v#{version}"
    release_json = URI.open(release_api,
      "Authorization" => "Bearer #{token}",
      "Accept" => "application/vnd.github+json"
    ).read
    asset = JSON.parse(release_json)["assets"].find { |a| a["name"] == asset_name }
    asset_id = asset["id"]

    # Download actual file
    asset_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/assets/#{asset_id}"
    system "curl", "-L",
      "-H", "Authorization: Bearer #{token}",
      "-H", "Accept: application/octet-stream",
      "--output", temporary_path,
      asset_api

    raise "Download failed!" unless File.exist?(temporary_path)
  end
end
