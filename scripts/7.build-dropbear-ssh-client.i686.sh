#! /usr/bin/env bash
echo 'building dropbear client [i686]'

cd ./../build/dropbear
make clean
./configure --disable-zlib
LTM_CFLAGS=-Os LDFLAGS="-Wl --gc-sections --static" CROSS_COMPILE=i686-linux-musl-cross/bin/i686-linux-musl- CFLAGS="-ffunction-sections -fdata-sections" ARCH=ix86_32
#	Optimizations as per Recommendation: https://github.com/mkj/dropbear/blob/master/SMALL.md
#	Cross-Compilation as per: http://landley.net/toybox/index.html
make PROGRAMS="dbclient" MULTI=1 ARCH=ix86_32
#	Making a single binary as per: https://github.com/mkj/dropbear/blob/master/MULTI.md
mv ./dropbearmulti ./../1440k-fdd

cd ./../../scripts

exit