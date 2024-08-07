#!/bin/bash
##	This script launches the OS/1337 image in QEMU for testing.

source ./config.sh

cd ./../build/$base_dir/

# Start up the image in qemu
qemu-system-i386 -drive file=$image_name,format=raw,index=0,media=disk
