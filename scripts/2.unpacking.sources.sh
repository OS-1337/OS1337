#! /usr/bin/env bash
echo 'Unpacking Sources...'
cd ./../build/working/
echo ''

echo 'Unpacking Linux Kernel Sources...'
tar -xf ../downloads/linux-6.5.tar.xz
mv ./linux-6.5 ./linux
echo 'Done unpacking Linux!'

echo ''

echo 'Unpacking Toybox Sources...'
tar -xf ../downloads/toybox-0.8.10.tar.gz
mv ./toybox-0.8.10 ./toybox
echo 'Done unpacking Toybox!'

echo ''

echo 'Unpacking musl-cross Sources...'
tar -xf ../downloads/i486-linux-musl-cross.tar.xz
echo 'Done unpacking musl-cross!'
echo ''
echo 'Adding musl-cross into /toybox & linux...'
cp -r ./i486-linux-musl-cross ./toybox/
cp -r ./i486-linux-musl-cross ./linux/
echo 'Added!'

echo ''

echo 'Unpacking musl Sources...'
tar -xf ../downloads//musl-1.2.4.tar.gz
echo 'Done unpacking musl source!'

echo 'Unpacking dropbear...'
tar -xf ../downloads/dropbear-2022.83.tar.bz2
mv ./dropbear-2022.83 dropbear
echo 'Done unpacking dropbear!'
echo ''
cd ./../../scripts
echo 'Done unpacking!'

exit
