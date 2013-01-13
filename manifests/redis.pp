include 'apt'

apt::ppa { 'ppa:chris-lea/redis-server':
  before => Anchor['redis::repo'],
}

anchor { 'redis::repo': }

package { 'redis-server':
  ensure  => latest,
  require => Anchor['redis::repo']
}

service { 'redis-server':
  ensure  => running,
  require => Package[redis-server],
}
