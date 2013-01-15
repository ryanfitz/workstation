
class i3wm(
  $user = $workstation::config::user
) inherits workstation::config {

  include 'apt'

  apt::source { "i3wm":
    location          => "http://debian.sur5r.net/i3/",
    release           => $lsbdistcodename,
    repos             => "universe",
    key               => "CD693E9E",
    key_source        => "puppet:///modules/workstation/sur5r-keyring.gpg",
    include_src       => false,
    before            => Anchor['i3wm::repo'],
  }

  anchor { 'i3wm::repo': }

  package { 'i3':
    ensure  => latest,
    require => Anchor['i3wm::repo']
  }

  package { 'suckless-tools':
    ensure => installed,
  }

  file { "$home/.i3":
    ensure => directory,
    owner    => $user,
    group   => $user,
    require => User[$user],
    source => "puppet:///modules/workstation/i3",
    recurse => true,
  }

}
