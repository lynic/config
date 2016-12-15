#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VAGRANT_VERSION="1.9.1"
VB_VERSION=5.1

# sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
cd /etc/yum.repos.d/
sudo curl -L http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -O
sudo yum install -y kernel-devel-`uname -r`
sudo yum install -y VirtualBox-${VB_VERSION}
#sudo KERN_DIR=/usr/src/kernels/`uname -r`/ /sbin/rcvboxdrv setup
# /sbin/vboxconfig
sudo usermod -aG vboxusers $(whoami)

curl -L https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.rpm -o /tmp/vagrant.rpm
cd /tmp/
sudo yum install ./vagrant.rpm

sudo yum install -y libvirt

# sudo yum install -y kernel-devel-`uname -r`
# sudo yum install -y VirtualBox-${VB_VERSION}
#sudo KERN_DIR=/usr/src/kernels/`uname -r`/ /sbin/rcvboxdrv setup
