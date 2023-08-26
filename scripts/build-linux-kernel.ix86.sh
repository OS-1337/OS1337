#! /usr/bin/env bash
echo 'building the basics'

cd ./../build/linux
make ARCH=x86 tinyconfig
make ARCH=x86 menuconfig
make ARCH=x86 bzImage
