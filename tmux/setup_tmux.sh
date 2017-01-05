#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y tmux tmux-top

if [[ -n $(grep -i centos /etc/redhat-release) ]];then
    sudo yum install -y python-pip
    sudo pip install powerline-status
    # if [[ ! -d ~/.local/share/fonts ]];then
    # git clone https://github.com/powerline/fonts /tmp/fonts
    # cd /tmp/fonts
    # ./install.sh
    # fi
    mkdir ~/.fonts/
    curl -o ~/.fonts/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    fc-cache -vf ~/.fonts/
else
    sudo yum install -y tmux-powerline
fi

cp $DIR/tmux.conf ~/.tmux.conf
cp $DIR/tmux.conf.local ~/.tmux.conf.local

