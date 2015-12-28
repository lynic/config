#!/bin/bash
set -x

sudo yum install -y vagrant vagrant-libvirt libvirt
sudo curl -o /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo yum install -y VirtualBox-5.0

if [[ -n `command -v zsh` && -z `grep 'alias v=' ~/.zshrc` ]];then
cat >> ~/.zshrc <<END
alias v='vagrant'
END
fi
