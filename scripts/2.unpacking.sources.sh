#! /usr/bin/env bash
echo 'Unpacking Sources...'
cd ./../build/
echo ''

echo 'unpacking Linux Kernel Sources...'
tar -xf ./linux-6.4.12.tar.xz
mv -r ./linux-6.4.12 ./linux
echo 'done'

echo ''

echo 'unpacking Toybox Sources...'
tar -xf toybox-0.8.10.tar.gz
mv -r ./toybox-0.8.10 ./toybox
echo 'done'

echo ''

echo 'unpacking musl-cross Sources...'
tar -xf i686-linux-musl-cross.tar.xz
echo 'done'
echo 'adding musl-cross into /toybox & linux'
cp -r ./i686-linux-musl-cross ./toybox/
cp -r ./i686-linux-musl-cross ./linux/
echo 'done'

echo ''

echo 'unpacking musl Sources...'
cp ./musl-1.2.4.tar.gz
tar -xf ./musl-1.2.4.tar.gz
echo 'done'

echo ''
cd ./../scripts

exit
