#   OS/1337
### Roadmap
What is the intended Roadmap for OS/1337:

---
## Prereleases - v0.0.x
### Working on the prerequesites.
- Getting everything sorted out to work.
  - Bootable system.
    - Sorting out issues that [prevent boot beyond loading of kernel and initramfs](https://mstdn.social/deck/@kkarhan/111409592616485280)
      - See [current image](build/0.CORE/fdd/os1337.img)

---
## Initial Release - v0.1
### [Basic System for i486-SX and up on 1.440kB Floppy](build/0.CORE)
- Linux Kernel: [```bzImage```](build/0.CORE/fdd/bzImage)
  - Minimalist just to be able to run Toybox and provide Ethernet Networking
    - Supports the following NICs: AMD, Broadcom, Intel, Marvell, Realtek, VIA,
  - MDA / local console @ 80x25
- Toybox: [```toybox```](build/0.CORE/fdd/fs/bin/toybox)
- Bootloader: [```syslinux```](build/0.CORE/fdd/syslinux.cfg)
- Init Script: [```rc```](build/0.CORE/fdd/fs/etc/init.d/rc)
- Dropbear SSH Client: [```dbclient```](build/0.CORE/fdd/fs/bin/dbclient)
#### All Components are statically compiled against musl-cross.

---
## Bugfixes - v0.1.x
### Correcting post-release mistakes where applicable.

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

---
## Future Releases - v1.0
### Further improvements down the line.
- [OEM-Preinstaller similar to the one used for Ubuntu LTS](https://help.ubuntu.com/community/Ubuntu_OEM_Installer_Overview)
- 

---
#### [Back to README](README.md)