#!/bin/bash
set -x

sudo yum install -y tmux tmux-powerline zsh
cp /home/elynn/source/config/tmux/tmux.conf ~/.tmux.conf
cp /home/elynn/source/config/tmux/tmux.conf.local ~/.tmux.conf.local
../zsh/setup_zsh.sh
../vim/setup_vim.sh

