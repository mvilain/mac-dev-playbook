#/usr/bin/env bash
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi

# MacOS
wget https://download.jetbrains.com/idea/ideaIU-${ver}-aarch64.dmg -O ideaIU-${ver}-aarch64.dmg
wget https://download.jetbrains.com/idea/ideaIU-${ver}.dmg         -O ideaIU-${ver}.dmg
wget https://download.jetbrains.com/idea/ideaIC-${ver}.dmg         -O ideaIC-${ver}.dmg

# debian linux
wget https://download.jetbrains.com/idea/ideaIU-${ver}.tar.gz      -O ideaIU-${ver}.tar.gz

exit