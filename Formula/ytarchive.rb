class Ytarchive < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://github.com/Kethsar/ytarchive/archive/refs/tags/latest.tar.gz'
  version '0.3.2'
  sha256 '055d3e7129c737105d28f743bd3ce02fef57b116f95a8f3601a25c163634a252'
  license 'MIT'
  head 'https://github.com/Kethsar/ytarchive.git', branch: 'dev'

  depends_on 'go' => :build
  depends_on 'ffmpeg'

  def install
    ENV['CGO_ENABLED'] = '0'
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    system bin / 'ytarchive', '--version'
  end
end
