
class zsh(
  $user = $workstation::config::user
) inherits workstation::config {

  $ohmyzsh_dir = "$home/.oh-my-zsh"
  $zsh = '/usr/bin/zsh'

  package { 'zsh' :
    ensure  => installed,
  }

  exec { "ohmyzsh":
    command => "git clone git://github.com/robbyrussell/oh-my-zsh.git $ohmyzsh_dir",
    require => [File[$code_dir], Package['git']],
    creates => "$ohmyzsh_dir",
    path    => "/usr/bin",
    user    => $user;
  }

  exec { "change shell":
    command => "chsh -s $zsh $user",
    path    => "/usr/bin:/bin",
    require => Package['zsh'],
    unless => "grep -E '^${user}.+:${$zsh}$' /etc/passwd",
  }

}

