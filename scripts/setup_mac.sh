#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install HomeBrew
if [[ -z `command -v brew` ]];then
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install zsh tmux
brew install git git-review
git config --global core.editor vim

brew tap caskroom/cask
brew cask install iterm2
brew cask install vagrant
brew cask install virtualbox virtualbox-extension-pack

cp $DIR/../tmux/tmux.conf ~/.tmux.conf
cp $DIR/../tmux/tmux.conf.local.mac ~/.tmux.conf.local

# Install oh-my-zsh
if [[ ! -f ~/.zshrc ]];then
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
echo 'export HOMEBREW_GITHUB_API_TOKEN=71135fbace8ee405108617aea062824b80461def' >> ~/.zshrc
fi

# Install vim
if [[ ! -d ~/.vim_runtime ]];then
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
fi
cp $DIR/../vim/vimrc ~/.vim_runtime/my_configs.vim
