#! /usr/bin/env bash
##	This script downloads and unpacks musl-cross, which is the C Standard Library for OS/1337.

source ./config.sh

cd ../build/downloads
download_files $musl_cross_url $musl_cross_filename $musl_cross_desc

cd ../working
echo 'Unpacking musl-cross.'
tar -xf ../downloads/$musl_cross_filename

cd ../../scripts

exit