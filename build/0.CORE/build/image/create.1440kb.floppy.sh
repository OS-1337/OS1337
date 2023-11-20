#! /usr/bin/env bash
echo 'creating 1440kB 3,5" FDD Image and making it bootable...'
cd ./../../fdd/
sudo dd if=/dev/zero of=./os1337.img bs=1k count=1440
sudo mkdosfs ./os1337.img
sudo syslinux --install ./os1337.img
ls -alh
echo 'done!'
exit
