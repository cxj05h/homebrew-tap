require "download_strategy"
require "open-uri"
require "json"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless token

    # Get version and asset name from url or tap formula state:
    tag = @url # url is "v1.9.7"
    asset_name = "SQLMaestro-#{tag}.zip"

    # Fetch release info from GitHub API
    release_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/tags/#{tag}"
    release_json = URI.open(release_api,
      "Authorization" => "Bearer #{token}",
      "Accept" => "application/vnd.github+json"
    ).read
    asset = JSON.parse(release_json)["assets"].find { |a| a["name"] == asset_name }
    raise "Asset #{asset_name} not found in release!" unless asset
    asset_id = asset["id"]

    # Download actual release asset using asset API
    asset_api = "https://api.github.com/repos/cxj05h/SQL-Maestro/releases/assets/#{asset_id}"
    system "curl", "-L",
      "-H", "Authorization: Bearer #{token}",
      "-H", "Accept: application/octet-stream",
      "--output", temporary_path,
      asset_api

    raise "Download failed!" unless File.exist?(temporary_path)
  end
end
