#! /usr/bin/env bash
echo 'compressing filesystem into xz-compressed cpio initramfs'
cd ./../../fdd/fs
find . | cpio -H newc -o | xz -9 > ../rootfs.cpio.xz
ls -alh
echo 'done!'
exit
