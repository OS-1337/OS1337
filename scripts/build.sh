#! /usr/bin/env bash

./0.start.sh
./1.build-linux.sh
./2.build-toybox.sh
./3.build-dbclient.sh
./4.make.initramfs.sh
./5.make.1440k-image.sh

exit