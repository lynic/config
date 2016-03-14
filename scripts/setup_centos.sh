#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# disabled selinux
sudo setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# enable RPMFusion
if [[ -n $(grep -i fedora /etc/redhat-release) ]];then
sudo dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi

if [[ -n $(grep -i centos /etc/redhat-release) ]];then
sudo yum install -y epel-release
fi

$DIR/../zsh/setup_zsh.sh
$DIR/../tmux/setup_tmux.sh
$DIR/../vim/setup_vim.sh

