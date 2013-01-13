
class devuser($user = 'developer') {

  $code_dir = "/home/$user/Code"
  $git = "/usr/bin/git"

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
}
