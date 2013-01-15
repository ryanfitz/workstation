#!/usr/bin/env sh

dir=$(dirname $0)

echo "Setting up ubuntu workstation"
puppet apply --modulepath=$dir/modules $dir/manifests/init.pp
