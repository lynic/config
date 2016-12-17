#!/bin/bash

# TF_VERSION="0.8.1"
# PACKER_VERSION="0.12.1"

TF_VERSION=`wget -qO-  https://releases.hashicorp.com/terraform/ | grep "<body" -A 8 |tail -1| cut -d'/' -f3`
PACKER_VERSION=`wget -qO-  https://releases.hashicorp.com/packer/ | grep "<body" -A 8 |tail -1 |cut -d'/' -f3`
echo "Latest terraform version: ${TF_VERSION}"
echo "Latest packer version: ${PACKER_VERSION}"

if [[ -n $(command -v terraform) ]];then
  CURRENT_TF=`terraform version |tr -d "\n" |cut -d"v" -f2`
  echo "Current terraform version: ${CURRENT_TF}"
fi

if [[ -n $(command -v packer) ]];then
  CURRENT_PACKER=`packer version |tr -d "\n" |cut -d"v" -f2`
  echo "Current packer version: ${CURRENT_PACKER}"
fi

cd /tmp
if [[ "$TF_VERSOIN" != "$CURRENT_TR" ]];then
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
    unzip terraform_${TF_VERSION}_linux_amd64.zip
    sudo cp ./terraform /usr/sbin/
fi

if [[ "$PACKER_VERSION" != "$CURRENT_PACKER" ]];then
    wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
    unzip packer_${PACKER_VERSION}_linux_amd64.zip
    sudo cp ./packer /usr/sbin/
fi
