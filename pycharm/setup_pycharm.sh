#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source /etc/os-release
if [[ ! -f /etc/yum.repos.d/phracek-PyCharm-fedora-${VERSION_ID}.repo ]];then
    pushd /etc/yum.repos.d/
    sudo curl -L -O https://copr.fedoraproject.org/coprs/phracek/PyCharm/repo/fedora-${VERSION_ID}/phracek-PyCharm-fedora-${VERSION_ID}.repo
    popd
fi
sudo yum install -y pycharm-community
