#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y git zsh gitk git-review
if [[ ! -d ~/.oh-my-zsh ]];then
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

if [[ -n `command -v git` ]];then
    git config --global core.editor vim
fi
