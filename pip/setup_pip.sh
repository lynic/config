#!/bin/bash
set -x

if [[ ! -d ~/.pip ]]; then
  mkdir -p ~/.pip/cache
fi
cp pip.conf ~/.pip/

if sudo bash -c '[[ ! -d /root/.pip ]]'; then
  sudo mkdir -p /root/.pip/cache
fi
sudo cp pip.conf /root/.pip/
