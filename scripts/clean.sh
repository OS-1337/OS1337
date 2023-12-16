#! /usr/bin/env bash
source ./config.sh

echo 'Deleting all directories created in build.'
sudo rm ../build/{$base_dir/,downloads/,working/} -rf

exit
