#! /usr/bin/env bash
echo 'building the toybox [i686]'

cd ./../build/toybox
make ARCH=x86 menuconfig
echo 'completed!'
echo 'ready to compile for i586!'
cd ./../../scripts

exit