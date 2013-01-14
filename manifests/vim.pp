
class vim(
  $user = $workstation::config::user
) inherits workstation::config {

  package { 'vim' :
    ensure  => installed,
  }

  package { 'vim-gnome' :
    ensure  => installed,
  }

  package { 'exuberant-ctags' :
    ensure  => installed,
  }

  package { 'ack-grep' :
    ensure  => installed,
  }

  file { [$vim_dir, $bundle_dir]:
    ensure  => directory,
    owner   => $user,
    group   => $user,
    require => User[$user];
  }

  exec { "spf13-vim":
    command => "git clone --recursive -b 3.0 http://github.com/spf13/spf13-vim.git $vimspf_dir",
    require => Package['git'],
    creates => $vimspf_dir,
    path    => "/usr/bin",
    user    => $user,
    before => Anchor['vimspf::clone'];
  }

  exec { "vundle":
    command => "git clone http://github.com/gmarik/vundle.git $bundle_dir/vundle",
    require => [Package['git'], File[$bundle_dir]],
    creates => "$bundle_dir/vundle",
    path    => "/usr/bin",
    user    => $user,
    before => Anchor['vimspf::clone'];
  }

  anchor { 'vimspf::clone': }

  file { "$home/.vimrc":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$vimspf_dir/.vimrc",
  }

  file { "$home/.vimrc.bundles":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$vimspf_dir/.vimrc.bundles",
  }

  file { "$home/.vimrc.local":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$dotfiles_dir/vimrc.local",
    require => Exec[dotfiles]
  }

  file { "$home/.gvimrc.local":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$dotfiles_dir/gvimrc.local",
    require => Exec[dotfiles]
  }

  file { "$home/.vimrc.bundles.local":
    ensure => 'link',
    owner    => $user,
    group   => $user,
    target => "$dotfiles_dir/vimrc.bundles.local",
    require => Exec[dotfiles]
  }

  exec { "bundle install":
    command => "vim -u $vimspf_dir/.vimrc.bundles +BundleInstall! +BundleClean +qall",
    path    => "/usr/bin",
    user    => $user,
    subscribe => Exec["vundle"],
    refreshonly => true,
  }
}
