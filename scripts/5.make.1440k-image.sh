#! /usr/bin/env bash

source ./config.sh

##	TODO: Add special device files in /dev - see [Floppinux Manual]( docu/floppinux/floppinux-manual.pdf ) p.5 for details.
#	sudo mknod dev/console c 5 1
#	sudo mknod dev/null c 1 3

echo 'Creating the 1440kB Floppy Image...'

cd ./../build/1440k-fdd/

echo 'writing blank image file...'
dd if=/dev/zero of=os1337.1440kB.fdd.img bs=1k count=1440
echo 'Done.'

echo 'formatting image with FAT12...'
mkdosfs os1337.1440kB.fdd.img
echo 'Done.'

echo 'installing syslinux bootloader into the image...'
syslinux --install os1337.1440kB.fdd.img
echo 'Done.'

echo 'mounting image and installing the OS/1337 into it...'
sudo mkdir -p $mount_dir
sudo mount -o loop os1337.1440kB.fdd.img $mount_dir
sudo cp bzImage $mount_dir
sudo cp rootfs.cpio.xz $mount_dir
sudo cp syslinux.cfg $mount_dir
sudo umount $mount_dir
echo 'Done.'

cd ./../../scripts/

exit
