#! /usr/bin/env bash
echo 'Building linux [i486]'

cd ./../build/working/linux
echo 'Done! Starting to compile...'
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 bzImage
echo 'Done!'

cd ./..
mkdir -pv ./i486
mv ./linux/arch/x86/boot/bzImage ../1440k-fdd
mv ./linux/.config ../1440k-fdd/syslinux.cfg
cd ./../../scripts

echo "Completed!"
echo 'You can find the Kernel at ./build/1440k-fdd/bzImage'
echo 'Your linux configuration has been backed up to ./build/1440k-fdd/syslinux.cfg'

exit
