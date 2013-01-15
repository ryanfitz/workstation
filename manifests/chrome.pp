
class chrome() {
  include 'apt'

  apt::source { "google-chrome":
    location          => "http://dl.google.com/linux/chrome/deb",
    release           => "stable",
    repos             => "main",
    key               => "7FAC5991",
    key_source        => "https://dl-ssl.google.com/linux/linux_signing_key.pub",
    include_src       => false,
    before            => Anchor['chrome::repo'],
  }

  anchor { 'chrome::repo': }

  package { 'google-chrome-stable':
    ensure  => latest,
    require => Anchor['chrome::repo']
  }

}
