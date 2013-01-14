
class tmux(
  $user = $workstation::config::user
) inherits workstation::config {

  package { 'tmux' :
    ensure  => installed,
  }

  file { "$home/.tmux.conf":
    source => "puppet:///modules/workstation/tmux.conf",
    require => Package['tmux'],
    owner   => $user,
    group   => $user
  }

}

