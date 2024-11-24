#   OS/1337
### Build Order

So your OS/1337 build succeeds.

---

##
##	Packages

It is recommended to build the following packages in that specific order:

1. Linux Kernel
2. toybox Userland
3. dropbear SSH Client aka, ```dbclient```
4. kilo Text Editor
5. mlb Bootloader

##
##	Bootable Media

In order to get a bootable media, you need to do the following steps:

1. Generate the initramfs file system structure.
2. Add the packages (i.e. toybox, dbclient, kilo) and configuration files (i.e. /etc/inittab & /etc/init.d/rc) as well as folder stucture and *"spechal files"* to it.
3. generate a cpio archive of said initramfs.
4. configure linux to either include the initramfs.cpio or automatically select it for booting.
5. Create the image file of the specified size (i.e. 1440kB) by running ``dd if=/dev/zero of=os1337.img bs=1k count=1440`` 
6. Format it with a supported filesystem (i.e. FAT12)
7. use mlbinstall to make said image bootable
8. copy over the kernel & initramfs.
