#! /usr/bin/env bash
echo 'Downloading all the necessary packages...'

cd ./..
cd ./build
echo ''
echo 'Downloading latest Kernel Release [6.4.12] ...'
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz
echo 'done!'
echo ''
echo 'Downloading latest Toybox Release [0.8.10] ...'
wget http://landley.net/toybox/downloads/toybox-0.8.10.tar.gz
echo 'done!'
echo ''
echo 'Downloading musl-cross ...'
wget https://landley.net/bin/toolchains/latest/i686-linux-musl-cross.tar.xz
echo 'done!'
echo ''
echo 'Downloading latest musl Release [1.2.4] ...'
wget https://musl.libc.org/releases/musl-1.2.4.tar.gz
echo 'done!'
cd ./scripts
exit
