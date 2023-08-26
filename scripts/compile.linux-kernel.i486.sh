#! /usr/bin/env bash
echo 'building the kernel [i486]'

cd ./../build/linux
echo 'done! Starting to compile...'
make ARCH=x86 bzImage
echo 'done!'

cd ./..
mkdir ./i486
mkdir ./i486/config
mkdir ./i486/config/kernel
mv mv ./linux/arch/x86/boot/bzImage ./i486
cp ./linux/.config ./i486/config/kernel
cd ./../../scripts
echo 'completed!'
echo 'you can find the Kernel as ./i486/bzImage'
echo 'your kernel configuration has been backed up to ./i486/config/kernel'

exit