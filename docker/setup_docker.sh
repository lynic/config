#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ! -f /etc/yum.repos.d/docker.repo ]];then
if [[ -n $(grep -i fedora /etc/redhat-release) ]];then
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
else
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
fi
fi

if [[ -z $(command -v docker) ]];then
sudo yum install -y docker-engine
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo grouadd -f docker
sudo usermod -aG docker $USER
fi
