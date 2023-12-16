#! /usr/bin/env bash

source ./config.sh


echo 'Configuring toybox [i686]'

echo 'Check for config file.'
if test -f ./$profile_dir/toybox.config; then
  echo "Copying kernel config."
  cp -v ./$profile_dir/toybox.config ../build/working/toybox/.config
fi


cd ./../build/working/toybox/
if test -f .config; then
  echo "Toybox config found."
else
 echo 'No config found.'
fi

make ARCH=x86 menuconfig
echo 'Completed. Ready to compile for i486.'

echo 'Building toybox [i686].'
LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox
echo 'Done.'

cp -v ./toybox ../../1440k-fdd/rootfs/bin/
cd ../../1440k-fdd/rootfs/bin/

# Create symlinks for all toybox commands
for i in $(./toybox); do ln -vs toybox $i; done
cd ../../../../scripts/

exit
