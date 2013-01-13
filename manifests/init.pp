import "devuser.pp"
import "rubydev.pp"

node default {
  $user = fitz

  import "basedev.pp"
  import "nodejs.pp"

  class { "devuser":
    user => $user
  }

  class { "rubydev":
    user => $user
  }
}
