require "download_strategy"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def _headers
    raise "HOMEBREW_GITHUB_API_TOKEN is not set!" unless ENV["HOMEBREW_GITHUB_API_TOKEN"]
    {
      "Authorization" => "Bearer #{ENV['HOMEBREW_GITHUB_API_TOKEN']}",
      "Accept" => "application/octet-stream"
    }
  end

  def curl(*args, **options)
    super(*args, **options.merge(headers: _headers))
  end
end
