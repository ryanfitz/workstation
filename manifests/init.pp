import "config.pp"
import "devuser.pp"
import "rubydev.pp"
import "vim.pp"
import "zsh.pp"
import "tmux.pp"
import "chrome.pp"

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
  class { "tmux": }
  class { "chrome": }

  import "redis.pp"
}
