#! /usr/bin/env bash
./configure --disable-zlib --disable-x11 --disable-agent-forwarding
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-Os -ffunction-sections -fdata-sections" make ARCH=x86 dbclient
ls -alh
echo 'done!'
exit
