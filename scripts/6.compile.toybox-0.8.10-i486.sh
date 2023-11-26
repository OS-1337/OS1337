#! /usr/bin/env bash
echo 'Building toybox [i686]'

cd ./../build/working/toybox
echo 'Done! Starting to compile...'
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox
echo 'Done!'

cd ../../../scripts
echo 'Completed!'

exit
