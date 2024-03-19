#! /usr/bin/env bash

source ./config.sh

cd ../build/downloads
download_files $dropbear_url $dropbear_filename $dropbear_desc
cd ../working

echo 'Unpacking dropbear./n'
tar -xf ../downloads/$dropbear_filename
mv ./dropbear-$dropbear_version dropbear

cd dropbear

echo 'Building dropbear client [i486]'

sudo make clean
sudo ./configure --disable-zlib --disable-x11 --disable-agent-forwarding
sudo LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=../$cross_dir CFLAGS="-Os -ffunction-sections -fdata-sections" make ARCH=x86 -j $(( $(nproc) + 1 )) dbclient

sudo mv ./dbclient ../../$base_dir/rootfs/bin/

cd ../../../scripts

exit
