
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
