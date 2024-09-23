#! /usr/bin/env bash
# This file includes all Helper variables and functions.

# Cross compilation flag.
cross_dir=i486-linux-musl-cross/bin/i486-linux-musl-

# Directories to use
mount_dir=/mnt/os1337-fdd
profile_dir=profile/core
#profile_dir=profile/chonky

source ./$profile_dir/config.sh

# Download Information
# Versions
linux_version="6.6.6"
toybox_version="0.8.11"
musl_version="1.2.4"
dropbear_version="2024.85"
mlb_version="v0.0.1"

# Filenames
linux_filename="linux-$linux_version.tar.xz"
toybox_filename="toybox-$toybox_version.tar.gz"
musl_cross_filename="i486-linux-musl-cross.tar.xz"
musl_filename="musl-$musl_version.tar.gz"
dropbear_filename="dropbear-$dropbear_version.tar.bz2"
mlb_filename="$mlb_version.tar.gz"

#URLs
linux_url="https://cdn.kernel.org/pub/linux/kernel/v6.x/$linux_filename"
toybox_url="http://landley.net/toybox/downloads/$toybox_filename"
musl_cross_url="https://landley.net/bin/toolchains/latest/$musl_cross_filename"
musl_url="https://musl.libc.org/releases/$musl_filename"
dropbear_url="https://matt.ucc.asn.au/dropbear/releases/$dropbear_filename"
mlb_url="https://github.com/OS-1337/mlb/archive/refs/tags/$mlb_filename"


# Package Descriptions
linux_desc="Linux Kernel 6.6.6"
toybox_desc="toybox - latest stable release"
musl_cross_desc="musl-cross - the crosscompiling toolchain"
musl_desc="musl c library"
dropbear_desc="dropbear - a compact SSH Server / Client"
mlb_desc="mlb - the minimalist linux bootloader"

function download_files(){
  local url=$1
  local filename=$2
  local desc=$3

  if test -f $filename; then
    echo "File ${filename} already found."
  else
    echo "Downloading ${desc}."
    wget $url
    echo "Done downloading ${desc}."
  fi
  echo ''
}
