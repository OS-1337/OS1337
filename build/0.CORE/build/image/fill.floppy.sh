#! /usr/bin/env bash
echo 'mounting and setting up floppy image...'
cd ./../../fdd/
sudo mount -o loop ./os1337.img /mnt
sudo ls -alh /mnt
sudo cp bzImage /mnt
sudo cp rootfs.cpio.xz /mnt
sudo cp syslinux.cfg /mnt
sudo ls -alh /mnt
sudo umount /mnt
ls -alh
echo 'done!'
exit
