
include 'apt'

apt::ppa { 'ppa:chris-lea/node.js':
  before => Anchor['nodejs::repo'],
}

anchor { 'nodejs::repo': }

package { 'nodejs':
  name    => 'nodejs',
  ensure  => latest,
  require => Anchor['nodejs::repo']
}

package { 'nodejs-dev':
  ensure  => latest,
  require => Anchor['nodejs::repo']
}

package { 'npm':
  name    => 'npm',
  ensure  => latest,
  require => Anchor['nodejs::repo']
}
