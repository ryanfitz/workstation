class rubydev(
  $user = $workstation::config::user
) inherits workstation::config {
  include rvm

  rvm_system_ruby {
    'ruby-1.9.3-p362':
      ensure => 'present',
      default_use => true;
  }

  rvm::system_user {
    $user:
      #require => User[$user];
  }
}
