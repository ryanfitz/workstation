import "rubydev.pp"

node default {
  $user = fitz

  import "basedev.pp"
  import "nodejs.pp"

  user { "$user":
    ensure => present,
  }

  class { "rubydev":
    user => $user
  }
}
