#/usr/bin/env bash
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir=https://download.jetbrains.com/python

# MacOS
wget ${dir}/pycharm-${ver}-aarch64.dmg       -O pycharm-${ver}-aarch64.dmg
wget ${dir}/pycharm-${ver}.dmg               -O pycharm-${ver}.dmg

# debian linux
wget ${dir}/pycharm-community-${ver}.tar.gz  -O pycharm-community-${ver}.tar.gz

exit
