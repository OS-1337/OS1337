#! /usr/bin/env bash
cd ./..
cd ./dl/src
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz
cp ./linux-6.4.12.tar.xz ./linux.tar.xz
tar -xf ./linux.tar.xz
rm ./linux.tar.xz
mv ./linux-6.4.12 ./linux
ls -ahl
exit
