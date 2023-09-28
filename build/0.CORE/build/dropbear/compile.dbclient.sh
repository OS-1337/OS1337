#! /usr/bin/env bash
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-ffunction-sections -fdata-sections" make ARCH=x86 dbclient
ls -alh
exit