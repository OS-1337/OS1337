#! /usr/bin/env bash
cd ./..
cd ./dl/bin/toybox
rm ./toybox-*
wget -r -nH --cut-dirs=2 --no-parent -e robots=off --reject="index.html*" http://landley.net/toybox/bin/
ls -ahl

cd ./../../..
exit

