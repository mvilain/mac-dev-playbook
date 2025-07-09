#/usr/bin/env bash
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir=https://download5.operacdn.com/ftp/pub/opera/desktop/${ver}

# MacOS
wget ${dir}/mac/Opera_${ver}_Setup.dmg       -O Opera_${ver}_Setup.dmg

# windows
wget ${dir}/win/Opera_${ver}_Setup_x64.exe   -O Opera_${ver}_Setup_x64.exe
wget ${dir}/win/Opera_${ver}_Setup_arm64.exe -O Opera_${ver}_Setup_arm64.exe

exit