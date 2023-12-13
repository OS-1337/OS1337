## Scripts:

This directory contains experimental script files to build a disc image for the project. They are not currently used to make the images in 0.CORE.

Several files are copied by the scripts directly from fdd and fdd/fs in that directory.

Both linux.cfg and toybox.cfg are symbolic links to configuration files in that same area. They can be deleted and costom cfg files substituted.

The image built by these scripts is not guaranteed to be identical to one built with the scripts found in 0.CORE/build.

# Files:

- clean.sh - Deletes all the files created by the scripts.
- build.sh - Runs all the other scripts from 0 to 5 in order.
- launch.sh - Opens the image in qemu.
- config.sh - Contains variables determining things like the linux version to download.
- 0-5 - The various individual build steps to create the image.