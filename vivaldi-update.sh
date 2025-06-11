#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir="https://downloads.vivaldi.com/stable-auto/"

wget $dir/Vivaldi.$ver.universal.dmg      -O Vivaldi.$ver.universal.dmg
wget $dir/Vivaldi.$ver.arm64.exe          -O Vivaldi.$ver.arm64.exe
wget $dir/Vivaldi.$ver.x64.exe            -O Vivaldi.$ver.x64.exe
wget $dir/vivaldi-stable_$ver-1_amd64.deb -O vivaldi-stable_$ver-1_amd64.deb

exit