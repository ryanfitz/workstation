
class webdev(
) inherits workstation::config {

  package { 'apache2-utils':
    ensure  => installed,
  }

  package { 'siege':
    ensure  => installed,
  }

  package { 'optipng':
    ensure  => installed,
  }

  package { 'libjpeg-turbo-progs':
    ensure  => installed,
  }
}
