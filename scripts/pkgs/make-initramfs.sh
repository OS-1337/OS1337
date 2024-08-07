#! /usr/bin/env bash
##	This Script turns the pre-generated folders and files into the initramfs that OS/1337 loads and runs off.


source ./config.sh

cd ../build/$base_dir/rootfs

echo 'Creating initramfs.'

sudo chmod +rwx ./etc/init
sudo chown -R root:root .
find . | cpio -H newc -o | xz -9 --check=crc32 > ../rootfs.cpio.xz
ls -alh
echo 'Done.'

exit