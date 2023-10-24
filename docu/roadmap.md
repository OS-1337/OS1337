#   OS/1337
### Roadmap
What is the intended Roadmap for OS/1337:

---

## Initial Release - v0.0.1
### Basic System for i486-SX and up on 1.440kB Floppy
- Linux Kernel: ```bzImage```
  - Minimalist just to be able to run Toybox and provide Ethernet Networking
- Toybox: ```toybox```
- Bootloader: ```syslinux```
- Init Script: ```init.sh```
- Dropbear SSH Client: ```dbclient```

All Components are statically compiled against musl-cross.

---

## Future Releases - v0.x
### Quality of Life Features
- Ramdisk for non-persistent storage
  - Boot-to-RAMDISK option
- LiveCD versions with more packages
  - [spm](https://github.com/OS-1337/spm) as [package manager](https://en.wikipedia.org/wiki/Package_manager)
    - See [Wishlist for pkgs](https://github.com/OS-1337/pkgs/blob/main/docs/WISHLIST.tsv)
- Installer for installing onto a HDD/SSD
  - essential partitioning tools like cfdisk
