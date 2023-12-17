## Scripts:

This directory contains experimental script files to build a disc image for the project. They are not currently used to make the images in 0.CORE.

Several files are copied by the scripts directly from fdd and fdd/fs in that directory.

It'll use whatever configuration files are in the profile directory pointed to by profile_dir. Currently in the core directory, linux.config and toybox.config are just symbolic links to files over in build/0.CORE/build/linux and toybox. If you're working on your own custom version, make your own directory in profile and point the link there! build.sh calls the build.sh file in the profile_dir directory, so you can put in calls to your own build scripts for packages you are adding easily.

The image built by these scripts is not guaranteed to be identical to one built with the scripts found in 0.CORE/build.

# Files:

- clean.sh - Deletes all the files created by the scripts.
- build.sh - Runs all the other scripts from 0 to 5 in order.
- launch.sh - Opens the image in qemu.
- config.sh - Contains variables determining things like the linux version to download.
- 0-5 - The various individual build steps to create the image.