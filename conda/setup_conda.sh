#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ! -d $HOME/miniconda2 ]];then
curl -o /tmp/conda.sh https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash -x /tmp/conda.sh -b
fi

if [[ -z $(grep conda $HOME/.zshrc) ]];then
    export PATH=$HOME/miniconda2/bin:$PATH
    echo "export PATH=$HOME/miniconda2/bin:\$PATH" >> $HOME/.zshrc
    echo "alias sa='source activate'" >> ~/.zshrc
    echo "alias sd='source deactivate'" >> ~/.zshrc
fi
