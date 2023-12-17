#! /usr/bin/env bash
source ./config.sh

# Start up the image in qemu
qemu-system-i386 -drive file=o$image_name,format=raw,index=0,media=disk