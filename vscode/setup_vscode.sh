#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DESKTOP_DIR=$HOME/.local/share/applications/
CONFIG_DIR=$HOME/.config/Code/User/

# Download package
curl -L https://go.microsoft.com/fwlink/?LinkID=620884 -o /tmp/vscode.zip
unzip /tmp/vscode.zip -d /tmp

# Unpack to ~/Documents/
mv /tmp/VSCode-linux-x64 $HOME/Documents/vscode

if [[ ! -d $DESKTOP_DIR ]];then
    mkdir -p $DESKTOP_DIR
fi
cp $DIR/vscode.desktop $DESKTOP_DIR

if [[ ! -d $CONFIG_DIR ]];then
    mkdir -p $CONFIG_DIR
fi
cp $DIR/settings.json $CONFIG_DIR

