# Q: How do you build a working Linux system with toybox?
###### An excerpt from [Toybox FAQ - mkroot](http://landley.net/toybox/faq.html#mkroot).

## A: Toybox has a built-in system builder called "mkroot", with the Makefile target "make root". To enter the resulting root filesystem, "sudo chroot root/host/fs /init". Type "exit" to get back out.

Prebuilt binary versions of these system images, suitable for running under the emulator qemu, are uploaded to the website each release if you'd like to try before building from source.

You can cross compile simple three package (toybox+libc+linux) systems configured to boot to a shell prompt under qemu by setting CROSS_COMPILE= to a cross compiler prefix (or by installing cross compilers in the "ccc" subdirectory and specifying a target type with CROSS=) and also pointing the build at a Linux kernel source directory, ala:

    make root CROSS=sh4 LINUX=~/linux

Then you can cd root/sh4; ./qemu-sh4.sh to launch the emulator. (You'll need the appropriate qemu-system-* emulator binary installed.) Type "exit" when done and it should shut down the emulator on the way out, similar to exiting the chroot version. (Except this is more like you ssh'd to a remote machine: the emulator created its own CPU with its own memory and I/O devices, and booted a kernel in it.)

The build finds the three packages needed to produce this system because 
1. you're in a toybox source directory, 
2. your cross compiler has a libc built into it,
3. you tell it where to find a Linux kernel source directory with LINUX= on the command line. If you don't say LINUX=, it skips that part of the build and just produces a root filesystem directory (root/$CROSS/fs or root/host/fs if no $CROSS target specified), which you can chroot into if your architecture can run those binaries. (For PID other than 1, the /init script at the top of the directory sets up and cleans up the /proc mount points, so chroot root/i686/fs /init is a reasonable "poke around and look at things" smoketest.)

The CROSS= shortcut expects a "ccc" symlink in the toybox source directory pointing at a directory full of cross compilers. The ones I test this with are built from the musl-libc maintainer's musl-cross-make project, built by running toybox's scripts/mcm-buildall.sh in a musl-cross-make checkout directory, and then symlinking the resulting "ccc" subdirectory into toybox where CROSS= can find them:

    cd ~
    git clone https://github.com/landley/toybox
    git clone https://github.com/richfelker/musl-cross-make
    cd musl-cross-make
    ../toybox/scripts/mcm-buildall.sh # this takes a while
    ln -s $(realpath ccc) ../toybox/ccc

##### If you don't want to do that, you can download prebuilt binary versions and extract them into a "ccc" subdirectory under the toybox source.

Once you've installed the cross compilers, "make root CROSS=help" should list all the available cross compilers it recognizes under ccc, something like:

    aarch64 armv4l armv5l armv7l armv7m armv7r i486 i686 m68k microblaze mips mips64 mipsel powerpc powerpc64 powerpc64le s390x sh2eb sh4 x32 x86_64 

(A long time ago I tried to explain what some of these architectures were.)

You can build all the targets at once, and can add additonal packages to the build, by calling the script directly and listing packages on the command line:

    mkroot/mkroot.sh CROSS=all LINUX=~/linux dropbear

An example package build script (building the dropbear ssh server, adding a port forward from 127.0.0.1:2222 to the qemu command line, and providing a ssh2dropbear.sh convenience script to the output directory) is provided in the scripts/root directory. If you add your own scripts elsewhere, just give a path to them on the command line. (No, I'm not merging more package build scripts, I learned that lesson long ago. But if you want to write your own, feel free.)

#### Note: currently mkroot.sh cheats. If you don't have a .config it'll make defconfig and add CONFIG_SH and CONFIG_ROUTE to it, because the new root filesystem kinda needs those commands to function properly. If you already have a .config that _doesn't_ have CONFIG_SH in it, you won't get a shell prompt or be able to run the init script without a shell. This is currently a problem because sh and route are still in pending and thus not in defconfig, so "make root" cheats and adds them. I'm working on it. tl;dr if make root doesn't work "rm .config" and run it again, and all this should be fixed up in future when those two commands are promoted out of pending so "make defconfig" would have what you need anyway. It's designed to let yout tweak your config, which is why it uses the .config that's there when there is one, but the default is currently wrong because it's not quite finished yet. All this should be cleaned up in a future release, before 1.0.
