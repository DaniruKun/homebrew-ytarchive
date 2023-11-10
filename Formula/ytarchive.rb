class Ytarchive < Formula
  desc 'Archive live and upcoming Youtube.com live streams'
  homepage 'https://github.com/Kethsar/ytarchive'
  url 'https://github.com/Kethsar/ytarchive/archive/refs/tags/v0.4.0.zip'
  version '0.4.0'
  sha256 '14923e93948a34f55ffaf74926862b2eeced5db7c0c7f872e38097d0ad168b77'
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
