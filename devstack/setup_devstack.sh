#!/bin/bash
set -x
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
devstack_path=~/source/devstack

if [[ ! -d ~/source ]];then
    mkdir -p ~/source
fi

git clone https://github.com/openstack-dev/devstack $devstack_path

if [[ ! -f ${devstack_path}/local.conf ]];then
cp $SCRIPT_DIR/local.conf $devstack_path
fi

if [[ -n `command -v zsh` && -z "`grep devstack ~/.zshrc`" ]]; then
cat >> ~/.zshrc <<END

### devstack begin ###
function sopenrc {
pushd $devstack_path >/dev/null
eval \$(bash -c ". openrc \$1 \$2;env|sed -n '/OS_/ { s/^/export /;p}'")
popd >/dev/null
### devstack end ###
}
END
fi

source /etc/os-release
if [[ ! -f /etc/yum.repos.d/phracek-PyCharm-fedora-${VERSION_ID}.repo ]];then
    pushd /etc/yum.repos.d/
    sudo curl -O https://copr.fedoraproject.org/coprs/phracek/PyCharm/repo/fedora-${VERSION_ID}/phracek-PyCharm-fedora-${VERSION_ID}.repo
    popd
fi
sudo yum install -y pycharm-community
