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

echo -e 'Downloading necessary packages.\n'

cd ../../downloads

download_files $linux_url $linux_filename $linux_desc
download_files $toybox_url $toybox_filename $toybox_desc
download_files $musl_cross_url $musl_cross_filename $musl_cross_desc
#download_files $musl_url $musl_filename $musl_desc
download_files $dropbear_url $dropbear_filename $dropbear_desc

echo -e 'Unpacking sources.\n'
cd ../working

echo 'Unpacking Linux Kernel.'
tar -xf ../downloads/$linux_filename
mv ./linux-$linux_version ./linux
echo -e 'Done.\n'

echo 'Unpacking Toybox.'
tar -xf ../downloads/$toybox_filename
mv ./toybox-$toybox_version ./toybox
echo -e 'Done.\n'

echo 'Unpacking musl-cross.'
tar -xf ../downloads/$musl_cross_filename
echo -e 'Done.\n'

echo 'Adding musl-cross into /toybox & linux.'
cp -r ./i486-linux-musl-cross ./toybox/
cp -r ./i486-linux-musl-cross ./linux/
echo -e 'Added.\n'

#echo 'Unpacking musl.'
#tar -xf ../downloads/$musl_filename
#echo -e 'Done.\n'

echo 'Unpacking dropbear.'
tar -xf ../downloads/$dropbear_filename
mv ./dropbear-$dropbear_version dropbear
echo -e 'Done.\n'

cd ./../../scripts
echo -e 'Done unpacking.\n'

exit
