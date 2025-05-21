#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$ver"

wget $dir/linux-x86_64/en-US/firefox-$ver.deb            -O firefox-$ver.deb
wget $dir/mac/en-US/Firefox%20$ver.dmg                   -O "Firefox $ver.dmg"
wget $dir/win32/en-US/Firefox%20Setup%20$ver.exe         -O "Firefox Setup $ver.exe"
wget $dir/win64/en-US/Firefox%20Setup%20$ver.exe         -O "Firefox Setup64 $ver.exe"
wget $dir/win64-aarch64/en-US/Firefox%20Setup%20$ver.exe -O "Firefox Setup64-arm $ver.exe"
exit