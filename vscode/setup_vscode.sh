#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DESKTOP_DIR=$HOME/.local/share/applications/
CONFIG_DIR=$HOME/.config/Code/User/

# Download package
curl -L https://go.microsoft.com/fwlink/?LinkID=760867 -o /tmp/vscode.rpm
cd /tmp/
sudo yum install ./vscode.rpm -y
ln `pwd`/settings.json $CONFIG_DIR/settings.json

