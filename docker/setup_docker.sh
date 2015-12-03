#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y docker docker-vim docker-zsh-completion
sudo systemctl enable docker.service
sudo systemctl start docker.service
