#!/bin/bash
set -ex
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function brew_install {
    for software in "$@"; do
        if [[ -z `brew list |grep $software` ]]; then
            brew install $software
        fi
    done
}

function brew_cask_install {
    for software in "$@"; do
        if [[ -z `brew cask list |grep $software` ]]; then
            brew cask install $software
        fi
    done
}

# Install HomeBrew
if [[ -z `command -v brew` ]];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install needed tools
brew_install tmux
brew_install python
brew_install git git-review
git config --global core.editor vim

brew_cask_install iterm2
brew_cask_install vagrant
brew_cask_install virtualbox virtualbox-extension-pack

# Install oh-my-zsh
if [[ ! -f ~/.zshrc ]];then
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
cp -f ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
if [[ -z `grep VAGRANT_DEFAULT_PROVIDER ~/.zshrc` ]];then
    echo "export VAGRANT_DEFAULT_PROVIDER='virtualbox'" >> ~/.zshrc
fi


# Install powerline
pip install --user powerline-status
# POWERLINE_CONF=$(find $HOME -name powerline.conf |head -n 1)
# POWERLINE_CMD=$(find $HOME -name powerline-config | head -n 1)
cp $DIR/../tmux/tmux.conf ~/.tmux.conf
cp $DIR/../tmux/tmux.conf.local.mac ~/.tmux.conf.local
if [[ -z `grep POWERLINE_CONFIG_COMMAND ~/.zshrc` ]]; then
  echo 'export POWERLINE_CONFIG_COMMAND=/Users/$USER/Library/Python/2.7/bin/powerline-config' >> ~/.zshrc
fi
#sed -i "s/POWERLINE_CONF/$POWERLINE_CONF" ~/.tmux.conf.local
#sed -i "s/POWERLINE_CMD/$POWERLINE_CMD" ~/.tmux.conf.local
# Install fonts
if [[ ! -d ~/Documents/fonts ]];then
    cd ~/Documents/
    git clone https://github.com/powerline/fonts
    cd fonts
    ./install.sh
fi

# Install vim
if [[ ! -d ~/.vim_runtime ]];then
    git clone git://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi
cp $DIR/../vim/vimrc ~/.vim_runtime/my_configs.vim
