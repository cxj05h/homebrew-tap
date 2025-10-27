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

  # If you must override fetch, use this signature:
  def fetch(timeout: nil)
    # Just call super, as CurlDownloadStrategy does all the work.
    super(timeout: timeout)
  end
end
