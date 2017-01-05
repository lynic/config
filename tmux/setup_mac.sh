#!/bin/bash
set -x

brew install python tmux
pip install --user powerline-status

echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
echo 'export LANG=en_US.UTF-8' >> ~/.zshrc

POWERLINE_CONF=$(find $HOME -name powerline.conf |head -n 1)
POWERLINE_CMD=$(find $HOME -name powerline-config | head -n 1)

echo "export POWERLINE_CONFIG_COMMAND=$POWERLINE_CMD" >> ~/.zshrc

cp ./tmux.conf ~/.tmux.conf
cp ./tmux.conf.local.mac ~/.tmux.conf.local
echo "run-shell '/Users/elynn/Library/Python/2.7/bin/powerline-daemon -q'" >> ~/.tmux.conf.local
echo "source $POWERLINE_CONF" >> ~/.tmux.conf.local

git clone git clone https://github.com/powerline/fonts /tmp/fonts
cd /tmp/fonts
./install.sh
