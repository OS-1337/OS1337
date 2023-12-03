#! /usr/bin/env bash

source ./config.sh

echo 'Setting up the build environment...'

echo 'creating folders...'
mkdir -pv ../build/{1440k-fdd/rootfs/{dev,etc/init.d,proc,sys,tmp},downloads,working}
exit
