#!/bin/bash
set -x
OS=`uname`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
function setup_linux {
  DESKTOP_DIR=$HOME/.local/share/applications
  CONFIG_DIR=$HOME/.config/Code/User

  curl -L https://go.microsoft.com/fwlink/?LinkID=760867 -o /tmp/vscode.rpm
  cd /tmp/
  sudo yum install ./vscode.rpm -y
  if [[ ! -f $CONFIG_DIR/settings.json ]];then
    ln $DIR/settings.json $CONFIG_DIR/settings.json
  fi
}

function setup_mac {
  CONFIG_DIR="$HOME//Library/Application Support/Code/User"
  if [[ -z $(brew cask list|grep visual-studio-code) ]];then
    brew cask install visual-studio-code
  fi
  if [[ ! -f $CONFIG_DIR/settings.json ]];then
    ln "$DIR/settings.json" "$CONFIG_DIR/settings.json"
  fi
}

if [[ $OS -eq "Darwin" ]];then
  setup_mac
else
  setup_linux
fi 
