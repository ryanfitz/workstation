import "config.pp"
import "devuser.pp"
import "rubydev.pp"
import "vim.pp"
import "zsh.pp"

node default {
  class {"workstation::config":
    user => fitz
  }

  import "basedev.pp"
  import "nodejs.pp"

  class { "devuser": }
  class { "rubydev": }
  class { "vim": }
  class { "zsh": }

  import "redis.pp"
}
