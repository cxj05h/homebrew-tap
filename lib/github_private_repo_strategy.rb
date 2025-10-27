require "download_strategy"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless @github_token
  end

  def fetch
    # Add Authorization header for private repo access
    curl_args = [
      "--location",
      "--header", "Authorization: Bearer #{@github_token}",
      "--header", "Accept: application/octet-stream",
      "--output", temporary_path,
      url
    ]
    system "curl", *curl_args
  end
end
