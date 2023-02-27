class Ytarchive < Formula
  desc "Archive live and upcoming Youtube.com live streams"
  homepage "https://github.com/Kethsar/ytarchive"
  url "https://github.com/Kethsar/ytarchive/archive/refs/tags/latest.tar.gz"
  version "0.3.1"
  sha256 "8075ddb116f9a7e861fd7b318dfce3277dbebbdc8a8c2fcdf8f025d98c9a26a8"
  license "MIT"
  head "https://github.com/Kethsar/ytarchive.git", branch: "master"

  depends_on "go" => :build
  depends_on "ffmpeg"

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin/"ytarchive", "--version"
  end
end
