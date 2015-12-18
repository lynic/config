#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install HomeBrew
if [[ -z `command -v brew` ]];then
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh tmux brew-cask vagrant git
brew install virtualbox virtualbox-extension-pack
fi 

cp $DIR/tmux.conf ~/.tmux.conf
cp $DIR/tmux.conf.local.mac ~/.tmux.conf.local

# Install oh-my-zsh
if [[ ! -f ~/.zshrc ]];then
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
fi

# Install vim
if [[ ! -d ~/.vim_runtime ]];then
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
fi
cp $DIR/../vim/vimrc ~/.vim_runtime/my_configs.vim
