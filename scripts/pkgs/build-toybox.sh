#! /usr/bin/env bash

source ./config.sh

cd ../build/downloads
download_files $toybox_url $toybox_filename $toybox_desc

cd ../working
echo 'Unpacking Toybox.'
tar -xf ../downloads/$toybox_filename
mv ./toybox-$toybox_version ./toybox

cd ../../scripts

echo 'Configuring toybox [i686]'

echo 'Check for config file.'
if test -f ./$profile_dir/toybox.config; then
  echo "Copying toybox config."
  cp -v ./$profile_dir/toybox.config ../build/working/toybox/.config
fi

cd ../build/working/toybox/

echo 'Adding musl-cross into /toybox.'
cp -r ../i486-linux-musl-cross .

if test -f .config; then
  echo "Toybox config found."
else
 echo 'No config found.'
fi

make ARCH=x86 menuconfig
echo 'Completed. Ready to compile for i486.'

echo 'Building toybox [i686].'
LDFLAGS=--static CROSS_COMPILE=$cross_dir CFLAGS="-Os" make ARCH=x86 -j $(( $(nproc) + 1 )) toybox
echo 'Done.'

cp -v ./toybox ../../$base_dir/rootfs/bin/
cd ../../$base_dir/rootfs/bin/

# Create symlinks for all toybox commands
for i in $(./toybox); do ln -vs toybox $i; done
cd ../../../../scripts/

exit
