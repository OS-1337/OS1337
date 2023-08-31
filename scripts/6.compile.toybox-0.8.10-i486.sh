#! /usr/bin/env bash
echo 'building toybox [i686]'

cd ./../build/toybox
echo 'done! Starting to compile...'
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox
echo 'done!'

cd ./../scripts
echo 'completed!'

exit