
class i3wm(
  $user = $workstation::config::user
) inherits workstation::config {

  package { 'i3':
    ensure  => installed,
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
