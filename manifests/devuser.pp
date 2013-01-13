
class devuser($user = 'developer') {

  $home     = "/home/$user"
  $code_dir = "/$home/Code"

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
    command => "git clone git://github.com/ryanfitz/dotfiles.git $code_dir/dotfiles",
    require => [File[$code_dir], Package['git']],
    creates => "$code_dir/dotfiles",
    path    => "/usr/bin",
    user    => $user;
  }

  file { "$home/.fonts":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$code_dir/dotfiles/fonts",
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
