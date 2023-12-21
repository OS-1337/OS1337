#! /usr/bin/env bash

source ./config.sh

cd ../build/downloads
download_files $linux_url $linux_filename $linux_desc

cd ../working
echo 'Unpacking Linux Kernel.'
tar -xf ../downloads/$linux_filename
mv ./linux-$linux_version ./linux

cd ../../scripts

echo 'Check for config file.'
if test -f ./$profile_dir/linux.config; then
  echo "Copying kernel config."
  cp -v ./$profile_dir/linux.config ../build/working/linux/linux.config
fi

cd ../build/working/linux/

echo 'Adding musl-cross into linux.'
cp -r ../i486-linux-musl-cross .

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

LDFLAGS=--static CROSS_COMPILE=$cross_dir CFLAGS="-Os" make ARCH=x86 -j $(( $(nproc) + 1 )) bzImage
echo 'Done.'

cd ..
mkdir -pv ./i486
mv ./linux/arch/x86/boot/bzImage ../$base_dir
mv ./linux/.config ../$base_dir/linux.config
cd ../../scripts

echo "Completed."
echo "You can find the Kernel at ./build/$base_dir/bzImage"
echo "Your linux configuration has been backed up to ./build/$base_dir/linux.config"

exit
