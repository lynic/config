#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

if [[ -z $(command -v docker) ]];then
sudo yum install -y docker-engine
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo groupadd docker
sudo usermod -aG docker $(whoami)
fi
