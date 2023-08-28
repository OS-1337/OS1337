#! /usr/bin/env bash
echo 'building the kernel [i486]'

cd ./../build/linux
echo 'Generating linux-6.4.12-i686.config'
make ARCH=x86 tinyconfig
echo 'Please configure the Kernel...'
make ARCH=x86 menuconfig
echo 'completed!'
echo 'ready to compile for i486!'
cd ./../../scripts

exit