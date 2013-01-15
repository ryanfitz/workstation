Workstation: Puppet modules to create an Ubuntu (nodejs) Development Environment

# INSTALLATION

1. Checkout the repo

  ```
  git clone --recursive git://github.com/ryanfitz/workstation.git
  ```
2. Install puppet
  
  ```
  sudo apt-get install puppet
  ```
3. Install scripts

  ```
  sudo puppet apply --modulepath=workstation/modules workstation/manifests/init.pp
