#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VAGRANT_VERSION="1.9.1"
VB_VERSION="5.1"

# Install VirtualBox
cd /etc/yum.repos.d/
sudo curl -L http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -O
sudo yum install -y kernel-devel-`uname -r`
sudo yum install -y VirtualBox-${VB_VERSION}
sudo usermod -aG vboxusers $(whoami)

# Install vagrant
curl -L https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.rpm -o /tmp/vagrant.rpm
cd /tmp/
sudo yum install ./vagrant.rpm

# Install libvirt
sudo yum install -y qemu libvirt libvirt-devel ruby-devel gcc qemu-kvm
sudo usermod -aG libvirt $(whoami)
# vagrant plugin install vagrant-libvirt
