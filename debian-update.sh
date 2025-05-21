#!/usr/bin/env bash -xv
VER=$1
if [[ -z $VER ]]; then
  echo "usage: $0 [version]"
  exit
fi

DIR="https://mirror.us.leaseweb.net/debian-cd/$VER"

for f in \
  ${DIR}/amd64/bt-dvd/debian-$VER-amd64-DVD-1.iso.torrent \
  ${DIR}/i386/bt-dvd/debian-$VER-i386-DVD-1.iso.torrent \
  ${DIR}/amd64/bt-cd/debian-$VER-amd64-netinst.iso.torrent \
  ${DIR}/arm64/bt-dvd/debian-$VER-arm64-DVD-1.iso.torrent \
  ${DIR}/arm64/bt-cd/debian-$VER-arm64-netinst.iso.torrent \
  ${DIR}-live/amd64/bt-hybrid/debian-live-$VER-amd64-xfce.iso.torrent \
  ${DIR}/amd64/bt-cd/debian-mac-$VER-amd64-netinst.iso.torrent ; do
wget $f; done

wget ${DIR}/amd64/bt-dvd/SHA512SUMS \
  -O debian-$VER-amd64-DVD-1.iso.SHA512SUMS
wget ${DIR}/i386/bt-dvd/SHA512SUMS \
  -O debian-$VER-i386-DVD-1.iso.SHA512SUMS
wget ${DIR}/amd64/iso-cd/SHA512SUMS \
  -O debian-$VER-amd64-netinst.iso.SHA512SUMS
wget ${DIR}/arm64/bt-dvd/SHA512SUMS \
  -O debian-$VER-arm64-DVD-1.iso.SHA512SUMS
wget ${DIR}/arm64/bt-cd/SHA512SUMS \
  -O debian-$VER-arm64-netinst.iso.SHA512SUMS
wget ${DIR}-live/amd64/bt-hybrid/SHA512SUMS \
  -O debian-live-$VER-amd64-xfce.iso.SHA512SUMS
wget ${DIR}-live/i386/bt-hybrid/SHA512SUMS \
  -O debian-live-$VER-i386-xfce.iso.SHA512SUMS

for f in \
  ${DIR}/amd64/iso-dvd/debian-$VER-amd64-DVD-1.iso \
  ${DIR}/i386/iso-dvd/debian-$VER-i386-DVD-1.iso \
  ${DIR}/amd64/iso-cd/debian-$VER-amd64-netinst.iso \
  ${DIR}/arm64/iso-dvd/debian-$VER-arm64-DVD-1.iso \
  ${DIR}/arm64/iso-cd/debian-$VER-arm64-netinst.iso \
  ${DIR}-live/amd64/iso-hybrid/debian-live-$VER-amd64-xfce.iso \
  ${DIR}-live/i386/iso-hybrid/debian-live-$VER-i386-xfce.iso \
  ${DIR}/amd64/iso-cd/debian-mac-$VER-amd64-netinst.iso ; do
wget $f; done
