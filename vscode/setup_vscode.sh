#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DESKTOP_DIR=$HOME/.local/share/applications/
CONFIG_DIR=$HOME/.config/Code/User/

# Download package

# Unpack to ~/Documents/

if [[ ! -d $DESKTOP_DIR ]];then
    mkdir -p $DESKTOP_DIR
fi
cp $DIR/vscode.desktop $DESKTOP_DIR

if [[ ! -d $CONFIG_DIR ]];then
    mkdir -p $CONFIG_DIR
fi
cp $DIR/settings.json $CONFIG_DIR

