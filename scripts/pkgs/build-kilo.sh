#! /usr/bin/env bash

source ./config.sh

echo 'building kilo [i486]'

cd ../build/working
if test -d kilo; then
  echo 'kilo source found.'
else
  echo 'kilo source not found. Cloning from git.'
  git clone https://github.com/antirez/kilo.git
fi
cd kilo

make clean
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=../$cross_dir CFLAGS="-Os" ARCH=x86 make -j $(( $(nproc) + 1 )) 
strip kilo

cp -v ./kilo ../../$base_dir/rootfs/bin/

cd ../../../scripts/

exit
