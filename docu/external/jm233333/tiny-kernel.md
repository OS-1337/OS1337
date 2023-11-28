# Linux Kernel - Build and Run a Tiny Linux Kernel on QEMU
An excerpt from: [JM233333's Blog](https://blog.jm233333.com/linux-kernel/build-and-run-a-tiny-linux-kernel-on-qemu/#prerequisites)
- Licensed under Creative Commons CC-BY-NC-SA

##  Prerequisites
### Preface
#### Environment

My development environment (for reference) :
````
Ubuntu 20.04, 5.15.0-41-generic, x86_64 GNU/Linux
gcc 9.4.0
````
Archive version I used (for reference) :
````
Linux Kernel 5.15.57
BusyBox 1.35.0
````
Make sure your development environment meets the requirements below :
````
available disk storage : >4 GB for tiny build, >10 GB for full build
````
## Preparation

Download appropriate version of linux kernel and busybox :
Package 	Link
Linux Kernel 	The Linux Kernel Archives
(opens new window)
BusyBox 	BusyBox
(opens new window)

Download packages required to build the linux kernel (Ubuntu) :

sudo apt install libelf-dev dwarves libzstd-dev zstd

## Build a Tiny Linux Kernel
### Use tinyconfig

Unzip the downloaded archive, enter the directory and start to build (use 5.15.57 as example):
````
tar -xvf linux-5.15.57.tar.xz
cd linux-5.15.57
````
Generate an initial config that represents a minimal kernel (see Linux Kernel Tinification

(opens new window)) :
````
make tinyconfig
````
## Kernel Configurations

With tinyconfig we can run make and get a minimal kernel image, but this is not what we want - we can't even execute any programs on it. To get a minimal but meaningful kernel image, we shall enable several additional kernel configurations through menuconfig :
````
make menuconfig
````
#### Notice : For below-mentioned options, their name and position in menuconfig GUI (5.15.57) is given, which might be different in other versions of kernel.

Required and highly-recommanded options are listed below :
````
    [*] 64-bit kernel
    [*] Enable the block layer
    Processor type and features --->
        [*] Symmetric multi-processing support
    General setup --->
        [?] System V IPC
        [*] Initial RAM filesystem and RAM disk (initramfs/initrd) support
        Configure standard kernel features (expert users) --->
            [?] Sysfs syscall support
            [*] Enable support for printk
            [*] Enable futex support
        [?] Load all symbols for debugging/ksymoops
        [?] Disable heap randomization
        [?] Profiling support
    Executable file formats --->
        [*] Kernel support for ELF binaries
        [*] Kernel support for scripts starting with #!
    Device Drivers --->
        [*] Block devices --->
            [*] RAM block device support
        Character devices --->
            [*] Enable TTY
            Serial drivers --->
                [*] 8250/16550 and compatible serial support
                [*] Console on 8250/16550 and compatible serial port
    File systems --->
        Pseudo filesystems --->
            [*] /proc file system support
            [*] sysfs file system support
    Kernel hacking --->
        Compile-time checks and compiler options --->
            [*] Compile the kernel with debug info
            [*] Provide GDB scripts for kernel debugging
        Generic Kernel Debugging Instruments --->
            [*] Debug filesystem
            [*] KGDB: kernel debugger
        x86 Debugging --->
            [*] Early printk
````
## Build

Now we can run make and get the minimal kernel image we want :
````
make -j4
````
After make , a series of images will be generated, and we are concerned about the following (for more details about all generated images, see Difference between images in Linux kernel

(opens new window)) :
````
    bzImage : The generic linux kernel binary image file, which is used to boot the kernel on qemu. It is located at linux-5.15.57/arch/x86/boot/bzImage by default.
    vmlinux : This is the linux kernel in a statically linked executable file format, which contains useful information for debugging purposes, and is used to debug the kernel through gdb or other debug engines. It is located at linux-5.15.57/vmlinux by default, and vmlinux-gdb.py is generated together in modern-version linux kernel.
````

## Build BusyBox

Similar to linux kernel, we shall enable several additional options through menuconfig :
````
make menuconfig
````
Notice : For below-mentioned options, their name and position in menuconfig GUI (1.35.0) is given, which might be different in other versions of busybox.

Required and highly-recommanded additional options are listed below :
````
Settings --->
--- Build Options
    [*] Build static binary (no shared libs)
--- Debugging Options
    [*] Build with debug information
        [*] Disable compiler optimizations
````
After running make , we should also run make install to install BusyBox into the target directory specified by CONFIG_PREFIX .
````
    CONFIG_PREFIX can be set when configuring BusyBox, or be specified alternatively at install time (i.e., with a command line like make CONFIG_PREFIX=/tmp/foo install).
````
By default (i.e. CONFIG_PREFIX not set), BusyBox will be installed into busybox-1.35.0/_install .
````
make
make install
````
## Boot the Kernel with initramfs
### What is initramfs ?

When you come to this chapter, you must have several questions in your mind such as "what is initramfs ?" , etc. Since this article is a quick-start for beginners, we omit most of technical details here.

In brief, initramfs is a (compressed) cpio format archive which is extracted when the kernel boots up. By default, the initramfs archive is empty (consuming 134 bytes on x86). It could also be compressed with one of several compression algorithms (e.g. gzip).
````
cpio is a GNU tool used to copy files to and from archives. See Linux Man Page - cpio(1)
(opens new window) for more details.
````
In practice, initramfs is often used to perform some complex initialization operations in the user level (e.g. mount the root filesystem). However, at the same time, initramfs itself is really an easy way to directly boot the kernel. This makes it one of the best choices for beginners trying to build and run the linux kernel themselves.

initramfs could be used in one of the following two ways :
````
Internal : linked into the kernel image binary.
External : passed from outside at runtime.
````
We will use the external way in this chapter considering the flexibility.

For more details about initramfs, see Appendix : ramfs, rootfs and initramfs.

## Generate a Minimal initramfs

This section will tell you how to generate a minimal initramfs, which is almost empty, only containing a hello-world executable file.

At this moment, we want to construct an image which contains exactly one executable file init . It will be executed first when the kernel boots. Notice that the name of that executable file must be init . Otherwise, we have to construct a file system (e.g. ext4) on the image to let the kernel boot.

The example source code of init.c is as follows :
````
#include <stdio.h>

int main(void) {
	printf("hello, world!\n");
	fflush(stdout); // make sure the output is visible on the screen
	return 0;
}
````
Notice that we will not package glibc into the image (it is possible but not necessary), we should compile C programs statically :
````
gcc -static -o init init.c
````
Since we only need to package one file into the image, only one line of command with the GNU tool cpio can meet our requirement :
````
echo init | cpio -ov --format=newc > initramfs.img
````
See Linux Man Page - cpio(1)

(opens new window) for more details. Note that man cpio contains some bad advice that you should not follow, as the linux kernel documentation says :
````
The cpio man page contains some bad advice that will break your initramfs archive if you follow it. It says “A typical way to generate the list of filenames is with the find command; you should give find the -depth option to minimize problems with permissions on directories that are unwritable or not searchable.” Don’t do this when creating initramfs.cpio.gz images, it won’t work. The Linux kernel cpio extractor won’t create files in a directory that doesn’t exist, so the directory entries must go before the files that go in those directories. The above script gets them in the right order.
````
## Generate a initramfs with BusyBox

This section will tell you how to generate a BusyBox-based initramfs, which contains an interactive terminal and BusyBox command line tools.

The aforementioned one-line cpio-based command is really convenient. However, even if we want to package two files into the image, the generation progrcess will become much more complicated. For instance, we have to construct a file system on the image. Instead, We will introduce another method, which is more scalable, easy-to-use, and elegant.
### kernel-provided script

In fact, after building the kernel, a bash script and a binary file for constructing initramfs image are generated together. They are located at linux-5.15.57/usr :
````
usr/gen_initramfs.sh is the script we directly execute to generate the image. Notice that we must call it through the path ./usr/gen_initramfs.sh (or modify the script manually), because it will execute the binary file ./usr/gen_init_cpio .

usr/gen_init_cpio is a binary file used by usr/gen_initramfs.sh. It is compiled from gen_init_cpio.c .

usr/default_cpio_list is an input example for usr/gen_initramfs.sh . See below.
````
One of the typical usage of the script is as follows (run ./usr/gen_initramfs.sh -h for full usage):
````
./usr/gen_initramfs.sh -o <image_file> <cpio_source 1> <cpio_source 2> ... <cpio_source n>
````
Where <cpio_source_i> is one of the following :
````
If it is a regular file, the script will directly package it into the image.

If it is a directory, the script will package all files in the directory into the image.

If it is a .cpio archive, the script will take it as direct input to the image.

If it is a cpio list, the script will parse the cpio list and package all the listed files (and directories) into the image according to the entries.

./usr/gen_initramfs.sh -o ./mkfs/initramfs.img ./mkfs/bin ./mkfs/cpio_list2
# caution: all things in ./mkfs/bin will be mounted to / (e.g. ./mkfs/bin/xxx -> /xxx)
````
### cpio list

It is said that a cpio list is a text file containing newline-separated entries that describe the files to be included in the initramfs archive. usr/default_cpio_list provides several examples :
````
dir /dev 0755 0 0
nod /dev/console 0600 0 0 c 5 1
dir /root 0700 0 0

Run ./usr/gen_initramfs.sh -h for complete syntax rules of cpio entries.
````
### usage

Assume that the project structure is as follows :
````
/ --x-- linux-5.15.57/
    |
    x-- busybox-1.35.0/
    |
    x-- cpio_list
````
We can generate a BusyBox-based initramfs image through cpio list as follows :
````
cd ./linux-5.15.57/
./usr/gen_initramfs.sh -o initramfs.img ../busybox-1.35.0/_install ../cpio_list
````
The content of cpio_list is as follows, which you can modify on demand :
````
dir /dev 0755 0 0
nod /dev/console 0600 0 0 c 5 1
dir /root 0700 0 0

nod /dev/null 0666 0 0 c 1 3
nod /dev/zero 0666 0 0 c 1 5

dir /proc 0755 0 0
dir /sys  0755 0 0
dir /mnt  0755 0 0

file /init ./init.sh 0755 0 0
````
The content of init.sh is as follows :
````
#!/bin/sh

echo -e "\nhello, busybox!\n"

mount -t proc none /proc
mount -t sysfs none /sys
# mount -t debugfs none /sys/kernel/debug
 
echo -e "\nBoot took $(cut -d' ' -f1 /proc/uptime) seconds\n"
 
sh
````
## Boot on QEMU with initramfs

Assume that we have generate an initramfs image (either hello-world or BusyBox-based), we can boot the kernel on qemu with it as follows :
````
qemu-system-x86_64 \
    -kernel linux-5.15.57/arch/x86/boot/bzImage \
    -initrd initramfs.img \
    -append "console=ttyS0 root=/dev/ram init=/init"
````
## Configure VSCode for Linux Kernel Sources
- TBD.
  - https://github.com/amezin/vscode-linux-kernel
## ramfs, rootfs and initramfs (Optional)
- TBD.
### References
- [Building a tiny Linux kernel - by Anuradha Weeraman](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d)
- [Build the Linux Kernel and Busybox and run them on QEMU](https://www.centennialsoftwaresolutions.com/post/build-the-linux-kernel-and-busybox-and-run-them-on-qemu)
- [Linux Man Page - cpio(1)](https://linux.die.net/man/1/cpio)
- [Linux Kernel Documentation - ramfs, rootfs and initramfs](https://www.kernel.org/doc/html/latest/filesystems/ramfs-rootfs-initramfs.html)
- [StackExchange - Why do I need initramfs ?](https://unix.stackexchange.com/questions/122100/why-do-i-need-initramfs)
- [Linux Kernel Documentation - Early userspace support](https://www.kernel.org/doc/html/latest/driver-api/early-userspace/early_userspace_support.html)


# Appendix
## List of Error-and-Solution Pairs

EaSP #1
[make[1]: *** No rule to make target 'debian/canonical-certs.pem', needed by 'certs/x509_certificate_list'.  Stop.](https://askubuntu.com/questions/1329538/compiling-the-kernel-5-11-11)
