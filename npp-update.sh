#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir="https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v${ver}"

npp.${ver}.Installer.x64.exe

wget $dir/npp.${ver}.Installer.x64.exe      -O npp.${ver}.Installer.x64.exe
wget $dir/npp.${ver}.Installer.exe          -O npp.${ver}.Installer.exe
wget $dir/npp.${ver}.Installer.arm64.exe    -O npp.${ver}.Installer.arm64.exe
wget $dir/npp.${ver}.portable.x64.zip       -O npp.${ver}.portable.x64.zip

exit