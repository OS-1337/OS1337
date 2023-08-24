#! /usr/bin/env bash
cd ./..
cd ./dl/src
wget https://musl.libc.org/releases/musl-1.2.4.tar.gz
cp ./musl-1.2.4.tar.gz ./musl.tar.gz
tar -xzf ./musl.tar.gz
rm ./musl.tar.gz
ls -ahl
exit
