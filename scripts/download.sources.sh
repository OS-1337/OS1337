#! /usr/bin/env bash
echo 'Downloading all the necessary packages...'

cd ./..
cd ./build
echo 'Downloading latest Kernel Release [6.4.12] ...'

wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz
cp ./linux-6.4.12.tar.xz ./linux.tar.xz
tar -xf ./linux.tar.xz
rm ./linux.tar.xz
mv ./linux-6.4.12 ./linux
echo 'done'

echo 'Downloading latest Toybox Release [0.8.10] ...'
wget http://landley.net/toybox/downloads/toybox-0.8.10.tar.gz
cp ./toybox-0.8.10.tar.gz ./toybox.tar.gz
tar -xf ./toybox.tar.gz
rm ./toybox.tar.gz
echo 'done'

echo 'Downloading musl-cross ...'
wget https://landley.net/bin/toolchains/latest/x86_64-linux-musl-cross.tar.xz
tar -xf ./x86_64-linux-musl-cross.tar.xz
echo 'done'

echo 'Downloading latest musl Release [1.2.4] ...'
wget https://musl.libc.org/releases/musl-1.2.4.tar.gz
cp ./musl-1.2.4.tar.gz ./musl.tar.gz
tar -xf ./musl.tar.gz
rm ./musl.tar.gz
echo 'done'



exit
