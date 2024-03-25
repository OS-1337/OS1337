#! /usr/bin/env bash

source ./config.sh

cd ../build/working
if test -d mlb; then
  echo 'mlb source found.'
else
  echo 'mlb source not found. Cloning from git.'
  git clone https://github.com/OS-1337/mlb.git
fi

cd mlb

echo 'Adding musl-cross into mlb.'
cp -r ../i486-linux-musl-cross .

echo 'Building mlb [i386]. Note: nasm & xxd must be installed for this to compile.'

LDFLAGS=--static CROSS_COMPILE=$cross_dir CFLAGS="-Os" make ARCH=x86
echo 'Done.'

sudo chmod +rwx mlbinstall
mv mlbinstall ../../$base_dir
cd ../../../scripts

echo "Completed."
echo "You can find mlbinstall at ./build/$base_dir/mlbinstall"

exit
