#! /usr/bin/env bash
echo 'Downloading all the necessary packages...'

cd ./..
cd ./build
echo ''
echo 'Downloading latest Kernel Release [6..5] ...'
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.tar.xz
echo 'done!'
echo ''
echo 'Downloading latest Toybox Release [0.8.10] ...'
wget http://landley.net/toybox/downloads/toybox-0.8.10.tar.gz
echo 'done!'
echo ''
echo 'Downloading musl-cross ...'
wget https://landley.net/bin/toolchains/latest/i486-linux-musl-cross.tar.xz
echo 'done!'
echo ''
echo 'done!'
cd ./scripts
exit
