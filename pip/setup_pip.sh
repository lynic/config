#!/bin/bash
set -x

if [[ ! -d ~/.pip ]]; then
  mkdir -p ~/.pip/cache
fi
cp pip.conf ~/.pip/
