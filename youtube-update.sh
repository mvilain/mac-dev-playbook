#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi
dir="https://www.mediahuman.net/download"

wget $dir/YouTubeToMP3.dmg             -O YouTubeToMP3-${ver}.dmg
wget $dir/YouTubeToMP3-arm.dmg         -O YouTubeToMP3-${ver}-arm.dmg
wget $dir/YouTubeDownloader.dmg        -O YouTubeDownloader-${ver}.dmg
wget $dir/YouTubeDownloader-arm.dmg    -O YouTubeDownloader-${ver}-arm.dmg

exit