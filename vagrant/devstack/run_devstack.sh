#!/bin/bash
set -x

sudo pvcreate /dev/sdb
sudo vgcreate stack-volumes-default /dev/sdb
sudo pvcreate /dev/sdc
sudo vgcreate stack-volumes-lvmdriver-1 /dev/sdc

mkdir -p ~/data/

if [[ -f /etc/redhat-release ]]; then
  sudo yum install -y vim git screen postgresql-devel
  sudo yum install -y https://rdoproject.org/repos/rdo-release.rpm
  pushd /tmp/
  git clone https://github.com/id/zookeeper-el7-rpm
  sudo yum install make rpmdevtools -y
  pushd zookeeper-el7-rpm
  make rpm
  sudo yum install zookeeper*.rpm
  popd
  popd
  
  DEFAULT_NIC=`ip route |grep default |cut -d' ' -f5`
  SECOND_NIC=`ip route |grep -v $DEFAULT_NIC | tail -1 |cut -d' ' -f3`
  IP_ADDRESS=`ifconfig $SECOND_NIC |grep 'inet' |grep -v 'inet6' |awk '{print $2}'`
  HOSTNAME=`hostname`
  sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
  sudo iptables-save > /etc/sysconfig/iptables
else
#  sudo sh -c 'cat > /etc/apt/sources.list.d/backports.list <<END
#deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
#END'
  sudo apt-get update -y
  sudo apt-get install -y vim git python3
  sudo apt-get install -y bridge-utils ebtables
  IP_ADDRESS=`ifconfig eth1 | grep 'inet addr' | awk '{print $3}' | cut -d':' -f2`
  HOSTNAME=`hostname`
fi

sudo bash -c "echo \"$IP_ADDRESS  $HOSTNAME\" >> /etc/hosts"

DEVSTACK_DIR='/opt/stack/devstack/'

if [[ ! -d $DEVSTACK_DIR ]]; then
  cd /opt/stack/
  git clone https://github.com/openstack-dev/devstack
fi

if [[ -e /opt/stack/local.conf ]]; then
  cp /opt/stack/local.conf $DEVSTACK_DIR
else
  cp /vagrant/local.conf $DEVSTACK_DIR
fi

cd $DEVSTACK_DIR
sed -i "s/#HOST_IP=8.8.8.8/HOST_IP=$IP_ADDRESS/" local.conf
bash ./stack.sh
