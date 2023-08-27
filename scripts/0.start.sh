#! /usr/bin/env bash
echo 'Setting up the build envoirment...'

echo 'creating folders...'
cd ./..
mkdir ./build
mkdir ./build/1440k-fdd
kmdir ./build/1440k-fdd/rootfs
kmdir ./build/1440k-fdd/rootfs/dev
kmdir ./build/1440k-fdd/rootfs/etc
kmdir ./build/1440k-fdd/rootfs/etc/init.d
kmdir ./build/1440k-fdd/rootfs/proc
kmdir ./build/1440k-fdd/rootfs/sys
kmdir ./build/1440k-fdd/rootfs/tmp
cd ./scripts
exit