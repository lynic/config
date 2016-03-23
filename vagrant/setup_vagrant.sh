#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VB_VERSION=5.0

if [[ -n $(grep -i fedora /etc/redhat-release) ]];then
# sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo yum install -y vagrant
else
# sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
sudo rpm -Uvh https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm
fi

vagrant plugin install vagrant-hostmanager
vagrant plugin install --plugin-version ">= 0.0.31" vagrant-libvirt
sudo yum install -y libvirt

# sudo yum install -y kernel-devel-`uname -r`
# sudo yum install -y VirtualBox-${VB_VERSION}
#sudo KERN_DIR=/usr/src/kernels/`uname -r`/ /sbin/rcvboxdrv setup

if [[ -n `command -v zsh` && -z `grep 'vagrant begin' ~/.zshrc` ]];then
cat >> ~/.zshrc <<END

### vagrant begin ###
alias v='vagrant'
# export VAGRANT_DEFAULT_PROVIDER='virtualbox'
### vagrant end ###
END
fi
# if [[ ! -d ~/.vagrant.d/ ]];then
#     mkdir ~/.vagrant.d/
# fi
# cp $DIR/Vagrangfile ~/.vagrant.d/
