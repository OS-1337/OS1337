#! /usr/bin/env bash

source ./config.sh

echo 'Setting up the build environment:'

echo 'Creating folders.'
mkdir -pv ../build/{$base_dir/rootfs,downloads,working}
mkdir -pv ../build/$base_dir/rootfs/{bin,boot,dev,etc/{init.d,opt,sgml,xml},home,lib,proc,root,run,sbin,srv,sys,tmp,usr/{local,share,src},var/{cache,lib,lock,log,mail,opt,run,spool/mail,tmp}}
ln -s /bin ../build/$base_dir/rootfs/usr/bin
ln -s /sbin ../build/$base_dir/rootfs/usr/sbin
ln -s /lib ../build/$base_dir/rootfs/usr/lib
ln -s /lib ../build/$base_dir/rootfs/lib32

echo 'Copying files.'
cp -vr ./$profile_dir/rootfs ../build/$base_dir/
cp -v ./$profile_dir/syslinux.cfg ../build/$base_dir/

echo 'Creating special files needed for system.'
cd ./../build/$base_dir/rootfs
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3

cd ../../../scripts

exit
