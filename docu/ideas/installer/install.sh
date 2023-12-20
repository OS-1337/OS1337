#! /bin toybox sh

##  This script will only run on OS/1337.
##  To use it on any other linux distro, you'll have to change the first line into
## #! /usr/bin/env bash
## Without the ## before it.

clear

echo 'Welcome to the OS/1337 Installer!'
echo 'This will download and write an image of OS/1337 to a device on this system!'

echo 'the following devices have been detected:'
echo ''

lsblk -e7
## Queries for physical block devices of the system

echo ''
echo 'if you see no entries, then chances are there are no bootable devices being detected at all.'
echo ''
echo 'if you are certain that one should be detectable and it is connected and'
echo 'visible from other OSes like MS-DOS, Windows or ideally another'
echo 'Linux Distribution, then please let us know about it via an issue'
echo 'on our GitHub. Not all Hardware can be supported tho and the'
echo '"CORE" Edition for example has a lot of drivers removed in order to'
echo 'fit on a 1440kB 3,5" HD FDD, including SATA & NVMe support.'
echo ''

exit