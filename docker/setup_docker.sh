#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo yum install -y docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
