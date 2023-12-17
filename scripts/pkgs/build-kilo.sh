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
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=../i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-Os" make
strip kilo

cp -v ./kilo ../../$base_dir/rootfs/bin/

cd ./../../../../scripts

exit
