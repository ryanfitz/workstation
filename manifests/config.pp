
class workstation::config(
  $user = 'developer',
) {

  $home     = "/home/$user"
  $code_dir = "$home/Code"
  $vimspf_dir = "$home/.spf13-vim-3"
  $vim_dir = "$home/.vim"
  $bundle_dir = "$vim_dir/bundle"
  $dotfiles_dir = "$code_dir/dotfiles"
}
