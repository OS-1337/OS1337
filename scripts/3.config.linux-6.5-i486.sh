#! /usr/bin/env bash
echo 'building the linux [i486]'

cd ./../build/linux
echo 'Generating 6.5-i486.config'
make ARCH=x86 tinyconfig
echo 'Please configure the Kernel...'
make ARCH=x86 menuconfig
echo 'completed!'
echo 'ready to compile for i486!'
cd ./../../scripts

exit