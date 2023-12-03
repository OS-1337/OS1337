# OS/1337
## TODO
### Immediate Tasks

---

## Completion
### Features
- Create a working and bootable system [as per Floppinux Manual](https://ia804503.us.archive.org/0/items/floppinux-manual/floppinux-manual.pdf).
  - Enshure the following commands are built into [Toybox .config](build/0.CORE/build/toybox/0.8.10-i486.config) to [enshure aliases in /etc/profile](build/0.CORE/rootfs/etc/profile) work.
    - wget [(w/o SSL as of now... See Issue #1)](https://github.com/OS-1337/OS1337/issues/1)
    - ls
    - ping
    - date
    - clear
    - echo
  - Enshure the following Applications are bundled so that their mappings work.
    - [dbclient](build/0.CORE/build/dropbear/dbclient-2022.83-i486.Makefile)
      - [Dropbear SSH Client](build/0.CORE/build/dropbear)

### Test Floppy Build
#### Test on Floppy Emulator [GOTEK 1M44]
#### Test on real Floppy [1440kB 3,5"]

### Keep it within size constraints:
- 1440kB in total
  - Current File Sizes:
    - [961kB for Linux 6.5](https://mstdn.social/@kkarhan/110986389151114648) 
    - ~ 130kB for Toybox 0.8.10
    - ~ 150kB for dbclient 2022.83 [Dropbear SSH Client]
- Check what can be fitted in
  - Possible Comfort Features
    - [RAMDISK Support using tmpfs](https://linuxhint.com/create-ramdisk-linux/)
      - Will require mount, free, umount, mkdir to work


---

## Bugfixing
### See: [Issue Tracker](https://github.com/OS-1337/OS1337/issues)

---

## Documentation

- ### Expand [README.md](README.md)
- #### Expand [building.md](docu/building.md)
  - Reproducible Build Instructions

---

## Testing
- ### Test and Refine OS/1337 "CORE" / "Floppy Version".
  - Document findings and errors as Bugs in the [Issue Tracker](https://github.com/OS-1337/OS1337/issues)

---
