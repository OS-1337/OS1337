#   OS/1337
### Roadmap
What is the intended Roadmap for OS/1337:

---
## Prereleases - v0.0.x
### Working on the prerequesites.
- Getting everything sorted out to work.
  - Bootable system.
    - Sorting out issues that [prevent boot beyond loading of kernel and initramfs](https://mstdn.social/deck/@kkarhan/111409592616485280)
- COMPLETED  [as per Commit](https://github.com/OS-1337/OS1337/blob/66586132bab1cea7d8acc44b4e0bee44a85f26b9/OS1337-core-prerelease.img)

---
## Initial Release - v0.1
### [Basic System for i486-SX and up on 1.440kB Floppy](build/0.CORE)
- Kernel: [```linux-6.6.6```](scripts/pkgs/build-linux.sh)
  - Minimalist just to be able to run Toybox and provide basic Ethernet Networking
    - Supports the following NICs: AMD, Intel, Realtek, VIA,
    - Grapics: [MDA](https://en.wikipedia.org/wiki/IBM_Monochrome_Display_Adapter) - local console @ 80x25 *- done!*
    - Sound: PC Beeper *- done!*
- Userland: [```toybox```](scripts/pkgs/build-toybox.sh)
- Bootloader: [```mlb```](scripts/pkgs/build-mlb.sh)
- Init Script: [```/etc/init```](scripts/profile/core/rootfs/etc/init) *- done!*
- Welcome Message: [```/welcome.txt```](scripts/profile/core/rootfs/welcome.txt) *- done!*
- SSH Client: [```Dropbear```](scripts/pkgs/build-dbclient.sh)
- Editor: [```kilo```](scripts/pkgs/build-kilo.sh)
#### All Components are statically compiled against musl-cross *and if applicable* to their dependencies.

---
## Bugfixes - v0.1.x
### Correcting post-release mistakes where applicable.

---
## Future Releases - v0.x
### Quality of Life Features
- Ramdisk for non-persistent storage
  - Boot-to-RAMDISK option [already status-quo!]
- LiveCD versions with more packages
  - [spm](https://github.com/OS-1337/spm) as [package manager](https://en.wikipedia.org/wiki/Package_manager)
    - See [Wishlist for Packages](https://github.com/OS-1337/pkgs/blob/main/docs/WISHLIST.tsv)
- Installer for installing onto a HDD/SSD
  - essential partitioning tools like cfdisk, mkfs.ext2, etc.
  - *Netinstaller* that also allows downloading the latest image into RAM and writing it to the target drive.
    - Similar to the [Raspberry Pi NetInstaller](https://www.raspberrypi.com/documentation/computers/getting-started.html#install-over-the-network) abeit with a [TUI](https://en.wikipedia.org/wiki/Text-based_user_interface)-based interface. Closer to [YaST](https://en.wikipedia.org/wiki/YaST) and [Debian Installer](https://en.wikipedia.org/wiki/Debian-Installer).
- [*Netboot*](https://en.wikipedia.org/wiki/Network_booting) support via [TFTP](https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol).
  - [*Web-Boot*](https://github.com/OS-1337/netboot) support via [HTTP](https://en.wikipedia.org/wiki/HTTP) and [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) using [iPXE](https://ipxe.org) - chainloading.
    - Integrity-Checks using Checksums (i.e. MD5+SHA1 being XOR'd) and/or OpenPGP Signature used exclusively to sign said boot images.

---
## Future Releases - v1.0
### Further improvements down the line.
- [OEM-Preinstaller similar to the one used for Ubuntu LTS](https://help.ubuntu.com/community/Ubuntu_OEM_Installer_Overview)
- *Unattended Installer* Configuration File Support
  - i.e. ```unattended.install.conf```or rather ```unattended.install.ydl``` (using [YADL](https://github.com/greyhat-academy/yadl) as configuration file format ).
- *Unattended Boot* Configuration File Support
  - i.e. ```unattended.boot.conf```or rather ```unattended.boot.ydl```.

---
#### [Back to README](README.md)