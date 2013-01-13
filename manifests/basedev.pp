
package { 'build-essential':
  ensure  => installed,
}

package { 'checkinstall' :
  ensure  => installed,
}

package { 'libssl-dev' :
  ensure  => installed,
}

package { 'git' :
  ensure  => installed,
}

package { 'curl' :
  ensure  => installed,
}

package { 'wget' :
  ensure  => installed,
}

package { 'zsh' :
  ensure  => installed,
}

package { 'vim' :
  ensure  => installed,
}

package { 'vim-gnome' :
  ensure  => installed,
}

package { 'tmux' :
  ensure  => installed,
}
