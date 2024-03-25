#! /usr/bin/env bash

source ./config.sh

cd ../build/downloads
download_files $mlb_url $mlb_filename $mlb_desc

cd ../working
echo 'Unpacking mlb.'
tar -xf ../downloads/$mlb_filename
mv ./mlb-$mlb_version ./mlb

cd ../../scripts

cd ../build/working/mlb/

echo 'Adding musl-cross into mlb.'
cp -r ../i486-linux-musl-cross .

echo 'Building mlb [i386]'

LDFLAGS=--static CROSS_COMPILE=$cross_dir CFLAGS="-Os" make ARCH=x86
echo 'Done.'

cd ..
mkdir -pv ./i486
mv ./mlbinstall ../$base_dir
mv ./mlb/.config ../$base_dir/mlb.config
cd ../../scripts

echo "Completed."
echo "You can find mlbinstall at ./build/$base_dir/mlbinstall"
echo "Your mlb configuration has been backed up to ./build/$base_dir/mlb.config"

exit
