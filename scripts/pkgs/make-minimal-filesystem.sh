#! /usr/bin/env bash

source ./config.sh

echo 'Setting up the build environment:'

echo 'Creating folders.'
sudo mkdir -pv ../build/{$base_dir/rootfs/{dev,etc/init.d,proc,sys,tmp,bin},downloads,working}

echo 'Copying files.'
sudo cp -vr ./$profile_dir/rootfs ../build/$base_dir/
sudo cp -v ./$profile_dir/syslinux.cfg ../build/$base_dir/

echo 'Creating special files needed for system.'
cd ./../build/$base_dir/rootfs
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3

cd ../../../scripts

exit
