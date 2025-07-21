#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi

dir="https://github.com/desktop/desktop/releases/download/release-${ver}"

wget $dir/GitHub.Desktop-x64.zip     -O GitHubDesktop-${ver}-x64.zip
wget $dir/GitHub.Desktop-arm64.zip   -O GitHubDesktop-${ver}-arm64.zip

exit