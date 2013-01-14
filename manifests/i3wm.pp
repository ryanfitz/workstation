
class i3wm(
  $user = $workstation::config::user
) inherits workstation::config {

  include 'apt'

  apt::source { "i3wm":
    location          => "http://debian.sur5r.net/i3",
    release           => $lsbdistcodename,
    repos             => "universe",
    include_src       => false,
    before            => Anchor['i3wm::repo'],
  }

  anchor { 'i3wm::repo': }

  exec { "install-sur5r-keyring":
    command => "/usr/bin/apt-get --allow-unauthenticated install sur5r-keyring",
    require => Anchor['i3wm::repo'],
    unless => "dpkg --get-selections | grep -E sur5r-keyring",
    path => "/usr/bin:/bin",
  }

  exec {"apt-get-update":
    command => "/usr/bin/apt-get update",
    require => Exec["install-sur5r-keyring"],
    subscribe => Exec["install-sur5r-keyring"],
    refreshonly => true,
  }

  package { 'i3':
    ensure  => latest,
    require => Exec["apt-get-update"],
  }

  package { 'suckless-tools':
    ensure => latest,
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
