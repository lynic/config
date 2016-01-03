#!/bin/bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SPIFF_VERSION=1.0.7

# git clone https://github.com/cloudfoundry/bosh-lite
# git clone https://github.com/cloudfoundry/cf-release
if [[ ! -e /usr/local/bin/spiff ]];then
    curl -o /tmp/spiff.zip -L https://github.com/cloudfoundry-incubator/spiff/releases/download/v${SPIFF_VERSION}/spiff_linux_amd64.zip
    pushd /tmp
    unzip spiff.zip
    chmod a+x spiff
    sudo mv spiff /usr/local/bin/
    popd
fi
pushd $DIR/bosh-lite
vagrant up --provider=virtualbox
# ./bin/add-route
./bin/provision_cf
popd
