#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum makecache
sudo yum install -y tmux tmux-powerline tmux-top git git-review gitk
cp $DIR/tmux.conf ~/.tmux.conf
cp $DIR/tmux.conf.local ~/.tmux.conf.local
$DIR/../zsh/setup_zsh.sh
$DIR/../vim/setup_vim.sh

