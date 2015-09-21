#!/bin/bash
sudo yum install -y vim git python34
cd /opt/stack/
if [[ ! -d devstack ]]; then
  git clone https://github.com/openstack-dev/devstack
fi
if [[ -e local.conf ]]; then
  cp local.conf devstack/
else
  cp /vagrant/local.conf devstack/
fi
cd devstack/
sed -i "s/#HOST_IP=8.8.8.8/HOST_IP=192.168.33.10/" local.conf
./stack.sh
