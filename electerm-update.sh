#/usr/bin/env bash
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir=https://github.com/electerm/electerm/releases/download/v${ver}
# MacOS
wget ${dir}/electerm-${ver}-mac-arm64.dmg  -O electerm-${ver}-mac-arm64.dmg
wget ${dir}/electerm-${ver}-mac-x64.dmg    -O electerm-${ver}-mac-x64.dmg

# debian linux
wget ${dir}/electerm-${ver}-linux-amd64.deb -O electerm-${ver}-linux-amd64.deb

exit