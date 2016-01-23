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
brew_install tmux
brew_install git git-review
git config --global core.editor vim
brew_install docker docker-machine docker-compose

brew tap caskroom/cask
brew_cask_install iterm2
brew_cask_install vagrant
brew_cask_install virtualbox virtualbox-extension-pack

cp $DIR/../tmux/tmux.conf ~/.tmux.conf
cp $DIR/../tmux/tmux.conf.local.mac ~/.tmux.conf.local

# Install oh-my-zsh
if [[ ! -f ~/.zshrc ]];then
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
cp -f ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "export VAGRANT_DEFAULT_PROVIDER='virtualbox'" >> ~/.zshrc
cat >> ~/.zshrc <<END
function endm {
docker-machine start \$1
eval \$(docker-machine env \$1)
}
alias dm='docker-machine'
alias vup='vagrant up'
alias vls='vagrant global-status'
END

# Install vim
if [[ ! -d ~/.vim_runtime ]];then
    git clone git://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi
cp $DIR/../vim/vimrc ~/.vim_runtime/my_configs.vim
