
class devuser(
  $user = $workstation::config::user
) inherits workstation::config {

  user { "$user":
    ensure => present,
  }

  file { $code_dir:
    ensure  => directory,
    owner   => $user,
    group   => $user,
    require => User[$user];
  }

  exec { "dotfiles":
    command => "git clone git://github.com/ryanfitz/dotfiles.git $dotfiles_dir",
    require => [File[$code_dir], Package['git']],
    creates => "$dotfiles_dir",
    path    => "/usr/bin",
    user    => $user;
  }

  file { "$home/.fonts":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$dotfiles_dir/fonts",
    require => Exec[dotfiles]
  }

  exec { "reload fonts":
    command => "fc-cache -f -v",
    path    => "/usr/bin",
    require => File["$home/.fonts"],
    subscribe => Exec["dotfiles"],
    refreshonly => true,
  }
}
