#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y tmux tmux-powerline tmux-top
cp $DIR/tmux.conf ~/.tmux.conf
cp $DIR/tmux.conf.local ~/.tmux.conf.local

if [[ -z "`grep 'tmux begin' ~/.zshrc`" ]];then 
cat >> ~/.zshrc <<END

### tmux begin ###
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
### tmux end ###
END
fi

