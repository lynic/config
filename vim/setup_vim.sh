#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y git vim ctags adobe-source-code-pro-fonts
if [[ ! -d ~/.vim_runtime ]];then
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
fi
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp $DIR/vimrc ~/.vim_runtime/my_configs.vim

if [[ -z "`grep upgrade_vim ~/.zshrc`" ]];then
cat >> ~/.zshrc <<END
function upgrade_vim() {
    pushd ~/.vim_runtime >/dev/null
    git pull -- rebase
    popd >/dev/null
}
END
fi
