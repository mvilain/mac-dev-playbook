#!/usr/bin/env bash
ver=${1%.*}     # strip subversion from version.subversion
rel=${1##*.}    # strip version from version.subversion

if [[ -z $ver || -z $rel ]]; then
  echo "usage: $0 [version.subversion]"
  exit
fi

home_dir=https://alpinelinux.org/downloads/
dir=https://dl-cdn.alpinelinux.org/alpine/v${ver}/releases

for i in \
  ${dir}/x86_64/alpine-extended-${ver}.${rel}-x86_64.iso \
  ${dir}/x86/alpine-extended-${ver}.${rel}-x86.iso \
  ${dir}/x86_64/alpine-standard-${ver}.${rel}-x86_64.iso \
  ${dir}/x86/alpine-standard-${ver}.${rel}-x86.iso \
  ${dir}/aarch64/alpine-standard-${ver}.${rel}-aarch64.iso \
  ${dir}/aarch64/alpine-virt-${ver}.${rel}-aarch64.iso \
  ${dir}/x86/alpine-virt-${ver}.${rel}-x86.iso \
  ${dir}/x86_64/alpine-virt-${ver}.${rel}-x86_64.iso ; do
wget $i; done
