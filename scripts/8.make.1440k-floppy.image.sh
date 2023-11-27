#! /usr/bin/env bash

##	TODO: Add spechal device files in /dev - see [Floppinux Manual]( docu/floppinux/floppinux-manual.pdf ) p.5 for details.
#	sudo mknod dev/console c 5 1
#	sudo mknod dev/null c 1 3


##	TODO: WIP! Don't run yet. The files aren't in the right locations, and we still need to create the rootfs image, and copy the toybox files, I believe.
#
# Creating the rootfs image can be based on:
# echo 'compressing filesystem into xz-compressed cpio initramfs'
# cd ./../../fdd/fs
##	TODO: put  [ /fs/ subdirectory ](build/0.CORE/fdd/fs) in rootfs.cpio.xz
# find . | cpio -H newc -o | xz -9 > ../rootfs.cpio.xz
# ls -alh
# echo 'done!'
# exit

echo 'Creating the 1440kB Floppy Image...'

cd ./../build/1440k-fdd/

echo 'writing blank image file...'
dd if=/dev/zero of=os1337.1440kB.fdd.img bs=1k count=1440
echo 'done!'

echo 'formatting image with FAT12...'
mkdosfs os1337.1440kB.fdd.img
echo 'done!'

echo 'installing syslinux bootloader into the image...'
syslinux --install os1337.1440kB.fdd.img
echo 'done!'

echo 'mounting image and installing the OS/1337 into it...'
sudo mkdir /mnt/os1337-fdd
sudo mount -o loop os1337.1440kB.fdd.img /mnt/os1337-fdd
sudo cp bzImage /mnt/os1337-fdd
sudo cp rootfs.cpio.xz /mnt/os1337-fdd
sudo cp syslinux.cfg /mnt/os1337-fdd
sudo umount /mnt/os1337-fdd
echo 'done!'


cd ./../../scripts/

exit
