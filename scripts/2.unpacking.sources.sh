#! /usr/bin/env bash

source ./config.sh

echo 'Unpacking Sources...'
cd ./../build/working/
echo ''

echo 'Unpacking Linux Kernel Sources...'
tar -xf ../downloads/$linux_filename
mv ./linux-$linux_version ./linux
echo 'Done unpacking Linux!'

echo ''

echo 'Unpacking Toybox Sources...'
tar -xf ../downloads/$toybox_filename
mv ./toybox-$toybox_version ./toybox
echo 'Done unpacking Toybox!'

echo ''

echo 'Unpacking musl-cross Sources...'
tar -xf ../downloads/$musl_cross_filename
echo 'Done unpacking musl-cross!'
echo ''
echo 'Adding musl-cross into /toybox & linux...'
cp -r ./i486-linux-musl-cross ./toybox/
cp -r ./i486-linux-musl-cross ./linux/
echo 'Added!'

echo ''

echo 'Unpacking musl Sources...'
tar -xf ../downloads/$musl_filename
echo 'Done unpacking musl source!'

echo 'Unpacking dropbear...'
tar -xf ../downloads/$dropbear_filename
mv ./dropbear-$dropbear_version dropbear
echo 'Done unpacking dropbear!'
echo ''
cd ./../../scripts
echo 'Done unpacking!'

exit
