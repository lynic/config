#!/bin/bash
set -x

devstack_path = {$1:-'~/source/devstack'}

if [[ -z `grep sopenrc ~/.zshrc` ]]; then

cat >> ~/.zshrc <<END

function sopenrc {
pushd $devstack_path >/dev/null
eval $(bash -c ". openrc $1 $2;env|sed -n '/OS_/ { s/^/export /;p}'")
popd >/dev/null
}
END

fi
