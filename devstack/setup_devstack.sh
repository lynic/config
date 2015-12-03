#!/bin/bash
set -x
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
devstack_path=~/source/devstack

if [[ ! -d ~/source ]];then
    mkdir -p ~/source
fi

git clone https://github.com/openstack-dev/devstack $devstack_path

if [[ ! -f ${devstack_path}/local.conf ]];then
cp $SCRIPT_DIR/../vagrant/devstack/local.conf $devstack_path
fi

if [[ -z "`grep sopenrc ~/.zshrc`" ]]; then
cat >> ~/.zshrc <<END
function sopenrc {
pushd $devstack_path >/dev/null
eval \$(bash -c ". openrc \$1 \$2;env|sed -n '/OS_/ { s/^/export /;p}'")
popd >/dev/null
}
END
fi
