#! /usr/bin/env bash

source ./config.sh

echo 'Check for config file.'
if test -f ./$profile_dir/linux.config; then
  echo "Copying kernel config."
  cp -v ./$profile_dir/linux.config ../build/working/linux/linux.config
fi

cd ../build/working/linux/
if test -f linux.config; then
  echo "Kernel config found."
  mv linux.config .config
else
 echo 'No config found. Generating tinyconfig.'
  make ARCH=x86 tinyconfig
fi

echo 'Please configure the Kernel.'
make ARCH=x86 menuconfig
echo 'Configured.'

echo 'Building linux [i486]'

LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 bzImage
echo 'Done.'

cd ./..
mkdir -pv ./i486
mv ./linux/arch/x86/boot/bzImage ../1440k-fdd
mv ./linux/.config ../1440k-fdd/linux.config
cd ./../../scripts

echo "Completed."
echo 'You can find the Kernel at ./build/1440k-fdd/bzImage'
echo 'Your linux configuration has been backed up to ./build/1440k-fdd/linux.config'

exit
