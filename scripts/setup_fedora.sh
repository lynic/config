#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/../zsh/setup_zsh.sh
$DIR/../tmux/setup_tmux.sh
$DIR/../vim/setup_vim.sh
$DIR/../vagrant/setup_vagrant.sh

