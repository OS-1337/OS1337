#! /usr/bin/env bash

function download_files(){
  local url=$1
  local filename=$2
  local desc=$3

  if test -f $filename; then
    echo "File ${filename} already found."
  else
    echo "Downloading ${desc}..."
    wget $url
    echo "Done downloading ${desc}!"
  fi
  echo ''
}

echo 'Downloading all the necessary packages...'
echo ''

cd ../build/downloads

download_files https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.tar.xz linux-6.5.tar.xz "latest kernel release"
download_files http://landley.net/toybox/downloads/toybox-0.8.10.tar.gz toybox-0.8.10.tar.gz "toybox"
download_files https://landley.net/bin/toolchains/latest/i486-linux-musl-cross.tar.xz i486-linux-musl-cross.tar.xz "musl-cross"
download_files https://musl.libc.org/releases/musl-1.2.4.tar.gz musl-1.2.4.tar.gz "musl"
download_files https://matt.ucc.asn.au/dropbear/releases/dropbear-2022.83.tar.bz2 dropbear-2022.83.tar.bz2 "dropbear"

echo 'Done with downloads!'
cd ../../scripts

exit
