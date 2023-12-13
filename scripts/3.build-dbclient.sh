#! /usr/bin/env bash

source ./config.sh

echo 'building dropbear client [i486]'

cd ./../build/working/dropbear
make clean
./configure --disable-zlib --disable-x11 --disable-agent-forwarding
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-Os -ffunction-sections -fdata-sections" make ARCH=x86 dbclient

mv ./dbclient ./../1440k-fdd/rootfs/bin/

cd ./../../../scripts

exit
