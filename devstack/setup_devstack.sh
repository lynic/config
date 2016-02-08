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

if [[ -n `command -v zsh` && -z "`grep sopenrc ~/.zshrc`" ]]; then
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

# for mongod
sudo cp $SCRIPT_DIR/disable-transparent-hugepages /etc/init.d/disable-transparent-hugepages
sudo chkconfig --add disable-transparent-hugepages

$SCRIPT_DIR/../pycharm/setup_pycharm.sh
