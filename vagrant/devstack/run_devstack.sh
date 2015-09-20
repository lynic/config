#!/bin/bash
#sudo apt-get install -y git vim
sudo yum install -y vim git
cd /opt/stack/
if [[ ! -d devstack ]]; then
  git clone https://github.com/openstack-dev/devstack
else
  pushd devstack/
  git pull origin master
  popd
fi
if [[ -e local.conf ]]; then
  cp local.conf devstack/
else
  cp /vagrant/local.conf devstack/
fi
cd devstack/
sed -i "s/#HOST_IP=8.8.8.8/HOST_IP=192.168.33.10/" local.conf
./stack.sh
