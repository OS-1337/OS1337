#! /usr/bin/env bash

source ./config.sh

cd ../build/$base_dir/rootfs

echo 'Creating initramfs.'

sudo chmod +rwx ./etc/init
sudo chown -R root:root .
find . | cpio -H newc -o | xz -9 --check=crc32 > ../rootfs.cpio.xz
ls -alh
echo 'Done.'

exit