#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source /etc/os-release
rhel_version='epel-7'
if [[ -n $(grep -i fedora /etc/redhat-release) ]];then
    rhel_verison="fedora-${VERSION_ID}"
fi
if [[ ! -f /etc/yum.repos.d/pycharm.repo ]];then
    sudo curl -L -o /etc/yum.repos.d/pycharm.repo https://copr.fedoraproject.org/coprs/phracek/PyCharm/repo/${rhel_version}/phracek-PyCharm-${rhel_version}.repo
fi
sudo yum install -y pycharm-community
