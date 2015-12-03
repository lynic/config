#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y git zsh
if [[ ! -d ~/.oh-my-zsh ]];then
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

if [[ -z "`grep 'alias tn=' ~/.zshrc`" ]];then 
cat >> ~/.zshrc <<END

alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
END
fi

if [[ -n `command -v git` ]];then
    git config --global core.editor vim
fi
