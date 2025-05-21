#!/usr/bin/env bash -xv
VER=$1
if [[ -z $VER ]]; then
  echo "usage: $0 [version]"
  exit
fi

DIR=https://mirrors.kernel.org/almalinux/$VER/isos

for ARCH in aarch64 x86_64; do
  mkdir AlmaLinux-$VER-$ARCH
  pushd AlmaLinux-$VER-$ARCH
  wget $DIR/$ARCH/AlmaLinux-$VER-$ARCH.torrent
  wget $DIR/$ARCH/CHECKSUM
  wget $DIR/$ARCH/AlmaLinux-$VER-$ARCH-boot.iso
  wget $DIR/$ARCH/AlmaLinux-$VER-$ARCH-minimal.iso
  wget $DIR/$ARCH/AlmaLinux-$VER-$ARCH-dvd.iso
  popd
done

exit
