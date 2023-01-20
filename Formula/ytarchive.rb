class Ytarchive < Formula
  desc "Archive live and upcoming Youtube.com live streams"
  homepage "https://github.com/Kethsar/ytarchive"
  url "https://github.com/Kethsar/ytarchive/archive/refs/tags/latest.tar.gz"
  version "0.3.1"
  sha256 "f61ac9b3606476306c208dd87961a3ca846efa92eaad651fa0270293c13a54c2"
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
