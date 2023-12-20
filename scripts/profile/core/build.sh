#! /usr/bin/env bash

echo "Current directory is $PWD"
./0.start.sh
#read -p "Press any key to continue... " -n1 -s

./pkgs/musl-cross.sh
#read -p "Press any key to continue... " -n1 -s

./1.build-linux.sh
#read -p "Press any key to continue... " -n1 -s
./2.build-toybox.sh

#read -p "Press any key to continue... " -n1 -s
./3.build-dbclient.sh

#read -p "Press any key to continue... " -n1 -s
./4.make.initramfs.sh
#read -p "Press any key to continue... " -n1 -s
./5.make-image.sh

exit