#! /usr/bin/env bash
source ./config.sh

full=false
while [ $# -gt 0 ] ; do
	case $1 in
		-a | --all) full=true ;;
	esac
	shift
done

echo 'Deleting main and working directories created in build.'
sudo rm ../build/{$base_dir/,working/} -rf

if $full ; then
	echo 'Deleting downloads.'
	rm ../build/downloads -rf
fi

exit
