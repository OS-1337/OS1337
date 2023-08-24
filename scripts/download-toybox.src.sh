#! /usr/bin/env bash
cd ./..
cd ./dl/src
wget http://landley.net/toybox/downloads/toybox-0.8.10.tar.gz
cp ./toybox-0.8.10.tar.gz ./toybox.tar.gz
tar -xzf ./toybox.tar.gz
rm ./toybox.tar.gz
ls -ahl
exit
