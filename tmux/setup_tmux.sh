#!/bin/bash
set -x

sudo yum install -y tmux tmux-powerline
cp /home/elynn/source/config/tmux/tmux.conf ~/.tmux.conf
cp /home/elynn/source/config/tmux/tmux.conf.local ~/.tmux.conf.local
