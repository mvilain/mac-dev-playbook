#!/usr/bin/env bash
VER=$1
if [[ -z $VER ]]; then
  echo "usage: $0 [version]"
  exit
fi

DIR=https://tails.boum.org/torrents/files

for f in \
  $DIR/tails-amd64-$VER.img.torrent \
  $DIR/tails-amd64-$VER.iso.torrent \
  $DIR/tails-amd64-$VER.img.sig \
  $DIR/tails-amd64-$VER.iso.sig ; do
  wget $f
done

wget https://mirrors.edge.kernel.org/tails/stable/tails-amd64-$VER/tails-amd64-$VER.iso
wget https://mirrors.edge.kernel.org/tails/stable/tails-amd64-$VER/tails-amd64-$VER.img
