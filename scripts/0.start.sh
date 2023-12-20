#! /usr/bin/env bash

source ./config.sh

echo 'Setting up the build environment:'

echo 'Creating folders.'
mkdir -pv ../build/{$base_dir/rootfs/{dev,etc/init.d,proc,sys,tmp,bin},downloads,working}

echo 'Copying files.'
cp -v ../build/0.CORE/fdd/fs/etc/{init,inittab,profile} ../build/$base_dir/rootfs/etc/
cp -v ./$profile_dir/welcome.txt ../build/$base_dir/rootfs/
cp -v ../build/0.CORE/fdd/syslinux.cfg ../build/$base_dir/

echo 'Creating special files needed for system.'
cd ./../build/$base_dir/rootfs
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3

# cd ../../downloads
# download_files $musl_cross_url $musl_cross_filename $musl_cross_desc

# cd ../working
# echo 'Unpacking musl-cross.'
# tar -xf ../downloads/$musl_cross_filename

cd ../../../scripts
echo -e 'Done unpacking.\n'

exit
