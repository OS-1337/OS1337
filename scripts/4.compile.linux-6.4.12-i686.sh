#! /usr/bin/env bash
4.compile.linux-kernel.i686.shecho 'building the linux [i686]'

cd ./../build/linux
echo 'done! Starting to compile...'
LDFLAGS=--static CROSS_COMPILE=i686-linux-musl-cross/bin/i686-linux-musl- make ARCH=x86 bzImage
echo 'done!'

cd ./..
mkdir ./i686
mkdir ./i686/config
mkdir ./i686/config/linux
mv mv ./linux/arch/x86/boot/bzImage ./linux/
cd ./../scripts
echo 'completed!'
echo 'you can find the Kernel as ./i686/bzImage'
echo 'your linux configuration has been backed up to ./i486/config/linux'

exit