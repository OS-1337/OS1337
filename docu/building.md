#   OS/1337
### Building Guide
With this guide, you should be able to reproduce the same binaries as released for OS/1337.

---
#
##  Prerequesites
#####   You'll need some aboslute basics in terms of tools.
Since there are a plethera of distributions, the exact names of packages may vary greaty, but you'll find that some are pretty much universally necessary.
- As the maintainer uses Ubunutu LTS [22.04] as of writing, these are the packages required:

```
build-essential
gcc
clang
llvm
gcc
make
libncurses-dev
flex
bison
openssl
libssl-dev
dkms
libelf-dev
libudev-dev
libpci-dev
libiberty-dev
autoconf
kconfig-frontends-nox
```
Which can be installed on Ubuntu 22.04 just by running
````
sudo apt install build-essential gcc clang llvm gcc make libncurses-dev flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf kconfig-frontends-nox
````
in the terminal.

#

---
## Building Linux Kernel
Without the Kernel, there's nothing that can handle the Hardware - period.
- Unless you'd be able and willing to go with x86 Assembly on your own.
##
#### Steps
1. Download the latest stable release from [kernel.org](https://kernel.org/) or any mirror of your personal trust.
2. unpack with `tar -xf ./linux-*` 
3. rename by using ` mv ./linux-* ./linux`
4. `cd ./linux`
5. `make ARCH=x86 tinyconfig`
6. `make ARCH=x86 menuconfig`
7. enshure to select the following options as enabled:
````
Processor type and features > Processor family > 486
Device Drivers > Character devices > Enable TTY
General Setup > Configure standard kernel features (expert users) > Enable support for printk
General Setup > Initial RAM filesystem and RAM disk (initramfs/initrd)
Executable file formats > Kernel support for ELF binaries
Executable file formats > Kernel support for scripts starting with #!
````
- #### Note that these are the absolute bare minimum options!
  - ##### These do not include any drivers for anything but a raw, local TTY console in MDA text mode with keyboard.
    - ###### You may want to add some basics like [ethernet] networking, filesystem support or USB to have anything remotely functional at your hands. 
9. Exit configuration (yes, save settings to .config)
9. `make ARCH=x86 bzImage` and let the compiler go brrr... ^
   - unless you literally use a potato with a 20+ year old HDD this shouldn't take very long.
10. `cd ./..`
11. `mv ./linux/arch/x86/boot/bzImage ./i486/`

### Congratulations, you now have a kernel for [i486](https://en.wikipedia.org/wiki/I486) and anything above.

---

#
## Building toybox
Toybox is a single-executeable Userland that replaces the GNUtils and is not dissimilar form BusyBox in that regard.
- It also comes with a simple init-file based init system and shell to get started.
##### Since OS/1337 is intended to be a sleek and minimalist distro that at it's core can still fit a 1440kB 3,5" FDD, it needs to save space.

Furthermore, it makes the system just work and enables users to not just SSH into things but also launch other programs.

[to be updated]

---
## Acknowledgements
###
### Floppinux
#### [Floppinux Manual](https://archive.org/details/floppinux-manual/)
It has a [pretty detailed and accurate writeup](https://archive.org/download/floppinux-manual/floppinux-manual.pdf) on how to build a minimal Linux that fits in 1.440kB.

---

#### [Back to README](README.md)