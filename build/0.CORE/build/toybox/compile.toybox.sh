#! /usr/bin/env bash
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox
ls -alh
exit