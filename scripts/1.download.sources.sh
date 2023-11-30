#! /usr/bin/env bash

source ./config.sh

echo 'Downloading all the necessary packages...'
echo ''

cd ../build/downloads

download_files $linux_url $linux_filename $linux_desc
download_files $toybox_url $toybox_filename $toybox_desc
download_files $musl_cross_url $musl_cross_filename $musl_cross_desc
download_files $musl_url $musl_filename $musl_desc
download_files $dropbear_url $dropbear_filename $dropbear_desc

echo 'Done with downloads!'
cd ../../scripts

exit
