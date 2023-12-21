#! /usr/bin/env bash

echo "Current directory is $PWD"
./pkgs/make-minimal-filesystem.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/musl-cross.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/build-linux.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/build-toybox.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/build-dbclient.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/make-initramfs.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/make-image.sh

exit