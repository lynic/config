#!/bin/bash
set -x

sudo yum install -y tmux tmux-powerline zsh
cp /home/elynn/source/config/tmux/tmux.conf ~/.tmux.conf
cp /home/elynn/source/config/tmux/tmux.conf.local ~/.tmux.conf.local
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

cat >> ~/.zshrc <<END

    alias tmux='tmux -2'
    alias ta='tmux attach -t'
    alias tn='tmux new -s'
    alias tl='tmux ls'
    alias tk='tmux kill-session -t'
END
