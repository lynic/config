#!/bin/bash
set -x

if [[ ! -d ~/.pip ]]; then
  mkdir ~/.pip
fi
cp pip.conf ~/.pip/
