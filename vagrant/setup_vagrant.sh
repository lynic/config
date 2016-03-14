#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y vagrant vagrant-libvirt libvirt
if [[ -n $(grep -i fedora /etc/redhat-release) ]];then
sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
else
sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
fi

sudo yum install -y kernel-devel-`uname -r`
sudo yum install -y VirtualBox-5.0
#sudo KERN_DIR=/usr/src/kernels/`uname -r`/ /sbin/rcvboxdrv setup

if [[ -n `command -v zsh` && -z `grep 'alias v=' ~/.zshrc` ]];then
cat >> ~/.zshrc <<END

### vagrant begin ###
alias v='vagrant'
export VAGRANT_DEFAULT_PROVIDER='virtualbox'
### vagrant end ###
END
fi
# if [[ ! -d ~/.vagrant.d/ ]];then
#     mkdir ~/.vagrant.d/
# fi
# cp $DIR/Vagrangfile ~/.vagrant.d/
