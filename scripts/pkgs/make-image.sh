#! /usr/bin/env bash

source ./config.sh

echo 'Creating the disk image...'

cd ../build/$base_dir/

echo 'writing blank image file...'
dd if=/dev/zero of=$image_name bs=1k count=$image_size
echo 'Done.'

echo 'formatting image with FAT12...'
mkdosfs $image_name
echo 'Done.'

echo 'installing syslinux bootloader into the image...'
syslinux --install $image_name
echo 'Done.'

echo 'mounting image and installing the OS/1337 into it...'
sudo mkdir -p $mount_dir
sudo mount -o loop $image_name $mount_dir
sudo cp bzImage $mount_dir
sudo cp rootfs.cpio.xz $mount_dir
sudo cp syslinux.cfg $mount_dir
sudo umount $mount_dir
echo 'Done.'

cd ../../scripts/

exit
