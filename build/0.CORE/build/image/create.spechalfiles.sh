#! /usr/bin/env bash
echo 'creating spechal files needed for system'
cd ./../../fdd/fs
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3
ls -alh
echo 'done!'
exit
