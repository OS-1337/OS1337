#! /usr/bin/env bash
echo 'compressing filesystem into xz-compressed cpio initramfs'
cd ./../../fdd/fs
chmod +x ./etc/init
sudo chown -R root:root .
find . | cpio -H newc -o | xz -9 > ../rootfs.cpio.xz
ls -alh
echo 'done!'
exit
