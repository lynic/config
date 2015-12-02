#!/bin/bash
set -x

sudo yum install -y git ctags adobe-source-code-pro-fonts
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
