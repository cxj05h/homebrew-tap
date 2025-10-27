require "download_strategy"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    ohai "Downloading with GitHubPrivateRepositoryReleaseDownloadStrategy"
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless ENV["HOMEBREW_GITHUB_API_TOKEN"]

    curl_args = [
      "--location",
      "--header", "Authorization: Bearer #{ENV['HOMEBREW_GITHUB_API_TOKEN']}",
      "--header", "Accept: application/octet-stream",
      "--output", temporary_path,
      url
    ]
    system "curl", *curl_args
    unless File.exist?(temporary_path)
      raise "Download failed!"
    end
  end
end
