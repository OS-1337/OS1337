#! /usr/bin/env bash
echo 'Creating the 1440kB Floppy Image...'

cd ./../build/1440k-fdd/

echo 'writing blank image file...'
echo dd if=/dev/zero of=os1337.1440kB.fdd.img bs=1k
count=1440
echo 'done!'

echo 'formatting image with FAT12...'
mkdosfs os1337.1440kB.fdd.img
echo 'done!'

echo 'installing syslinux bootloader into the image...'
syslinux --install os1337.1440kB.fdd.img
echo 'done!'

echo 'mounting image and installing the OS/1337 into it...'
sudo mount -o loop floppinux.img /mnt/os1337-fdd
sudo cp bzImage /mnt
sudo cp rootfs.cpio.xz /mnt
sudo cp syslinux.cfg /mnt
sudo umount /mnt/os1337-fdd
echo 'done!'


cd ./../../scripts/

exit
