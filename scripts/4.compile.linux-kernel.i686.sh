#! /usr/bin/env bash
echo 'building the linux [i486]'

cd ./../build/linux
echo 'done! Starting to compile...'
LDFLAGS=--static CROSS_COMPILE=i686-linux-musl-cross/bin/i686-linux-musl- make ARCH=x86 bzImage
echo 'done!'

cd ./..
mkdir ./i486
mkdir ./i486/config
mkdir ./i486/config/linux
mv mv ./linux/arch/x86/boot/bzImage ./linux/
cd ./../scripts
echo 'completed!'
echo 'you can find the Kernel as ./i486/bzImage'
echo 'your linux configuration has been backed up to ./i486/config/linux'

exit