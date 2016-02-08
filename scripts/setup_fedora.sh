#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# disabled selinux
sudo setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

$DIR/../zsh/setup_zsh.sh
$DIR/../tmux/setup_tmux.sh
$DIR/../vim/setup_vim.sh
$DIR/../vagrant/setup_vagrant.sh

