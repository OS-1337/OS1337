#! /usr/bin/env bash
##	This script builds the "core Edition" of OS/1337.

echo "Current directory is $PWD"

#	Download musl-cross, if it isn't present..
./pkgs/musl-cross.sh
#	read -p "Press any key to continue... " -n1 -s

#	Download toybox, if it isn't present, then build it.
./pkgs/build-toybox.sh
#	read -p "Press any key to continue... " -n1 -s

#	Download dropbear, if it isn't present, then build dbclient.
./pkgs/build-dbclient.sh
#	read -p "Press any key to continue... " -n1 -s

#	Create the initramfs structure.
./pkgs/make-initramfs.sh
#	read -p "Press any key to continue... " -n1 -s

#	Download and Build the linux kernel.
#	-	since the initramfs is being included into it [for ease of use with mlb], it needs to be build *after* the initramfs.
./pkgs/build-linux.sh
#	read -p "Press any key to continue... " -n1 -s

#	Generate the image file for booting.
./pkgs/make-image.sh
#	read -p "Press any key to continue... " -n1 -s

#	Format the image with a clean filesystem in.
./pkgs/make-minimal-filesystem.sh
#	read -p "Press any key to continue... " -n1 -s

#	Download and build mlb, if it doesn't exist.
#	-	Then install mlb as bootloader onto the image.
./pkgs/build-mlb.sh
#	read -p "Press any key to continue... " -n1 -s

echo "OS/1337 was build. You'll find it under $PWD/os1337.img."

exit