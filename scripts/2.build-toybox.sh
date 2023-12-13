#! /usr/bin/env bash

source ./config.sh

cd ./../build/working/toybox

echo 'Configuring toybox [i686]'

make ARCH=x86 menuconfig
echo 'Completed. Ready to compile for i486.'

echo 'Building toybox [i686].'
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox
echo 'Done.'

cd ../../../scripts

exit
