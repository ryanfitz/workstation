import "config.pp"
import "basedev.pp"
import "devuser.pp"
import "rubydev.pp"
import "vim.pp"
import "zsh.pp"
import "tmux.pp"
import "i3wm.pp"
import "chrome.pp"

node default {
  class {"workstation::config":
    user => fitz
  }

  stage { 'bootstrap':
    before => Stage['main'],
  }

  import "nodejs.pp"

  class { "basedev":
    stage => bootstrap,
  }

  class { "devuser": }
  class { "rubydev": }
  class { "vim": }
  class { "zsh": }
  class { "tmux": }
  class { "i3wm": }
  class { "chrome": }

  import "redis.pp"
}
