#!/usr/bin/env bash -xv
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi

dir=https://cdimage.kali.org/kali-${ver}
dest=kali-linux-${ver}
mkdir ${dest}
pushd ${dest}

for i in \
  ${dir}/kali-linux-${ver}-installer-amd64.iso.torrent \
  ${dir}/kali-linux-${ver}-installer-arm64.iso.torrent \
  ${dir}/kali-linux-${ver}-installer-everything-amd64.iso.torrent \
  ${dir}/kali-linux-${ver}-installer-netinst-amd64.iso.torrent \
  ${dir}/kali-linux-${ver}-installer-netinst-arm64.iso.torrent \
  ${dir}/kali-linux-${ver}-live-amd64.iso.torrent \
  ${dir}/kali-linux-${ver}-live-arm64.iso.torrent \
  ${dir}/kali-linux-${ver}-virtualbox-amd64.7z.torrent \
  ${dir}/kali-linux-${ver}-vmware-amd64.7z.torrent \
  ${dir}/HA256SUMS ; do 
wget $i; done

for i in \
  ${dir}/kali-linux-${ver}-installer-amd64.iso \
  ${dir}/kali-linux-${ver}-installer-arm64.iso \
  ${dir}/kali-linux-${ver}-installer-netinst-amd64.iso \
  ${dir}/kali-linux-${ver}-installer-netinst-arm64.iso \
  ${dir}/kali-linux-${ver}-live-amd64.iso \
  ${dir}/kali-linux-${ver}-live-arm64.iso \
  ${dir}/kali-linux-${ver}-virtualbox-amd64.7z \
  ${dir}/kali-linux-${ver}-vmware-amd64.7z ; do
wget $i; done

popd
exit
