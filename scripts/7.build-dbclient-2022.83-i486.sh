#! /usr/bin/env bash
echo 'building dropbear client [i486]'

cd ./../build/dropbear
make clean
./configure --disable-zlib
LTM_CFLAGS=-Os LDFLAGS="-Wl --gc-sections --static" CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-ffunction-sections -fdata-sections" ARCH=ix86
#	Optimizations as per Recommendation: https://github.com/mkj/dropbear/blob/master/SMALL.md
#	Cross-Compilation as per: http://landley.net/toybox/index.html
make PROGRAMS="dbclient" ARCH=ix86
#	Making a single binary as per: https://github.com/mkj/dropbear/blob/master/MULTI.md
mv ./dropbearmulti ./../1440k-fdd

cd ./../../scripts

exit