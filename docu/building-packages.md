#   OS/1337
### Building Packages

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
7. enshure to [select the following options](build/0.CORE/build/linux/linux-6.6.6-i486-minimal.config) as enabled:

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

8. Exit configuration (yes, save settings to .config)
9. `make ARCH=x86 bzImage` and let the compiler go brrr... ^
   - unless you literally use a potato with a 20+ year old HDD this shouldn't take very long.
10. `cd ./..`
11. `mv ./linux/arch/x86/boot/bzImage ./i486/`

### Congratulations, you now have a kernel for [i486](https://en.wikipedia.org/wiki/I486) and anything above.

---

#
## Building [toybox](https://landley.net/toybox)
[Toybox](https://github.com/landley/toybox) is a single-executeable Userland that replaces the [GNUtils](https://en.wikipedia.org/wiki/GNU_Core_Utilities) and is not dissimilar form [BusyBox](https://en.wikipedia.org/wiki/BusyBox) in that regard.
- It also comes with a simple init-file based init system and [shell](http://landley.net/toybox/status.html#shell) to get started.
##### Since OS/1337 is intended to be a sleek and minimalist distro that at it's core can still fit a 1440kB 3,5" FDD, it needs to save space.

Furthermore, it makes the system just work.

##
### Steps
1. Download the latest release Version of [Toybox](http://landley.net/toybox/downloads/?C=M;O=D) and [musl-cross as toolchain](http://landley.net/toybox/downloads/binaries/toolchains/?C=M;O=D).
2. unpack them put the ```musl-cross```-* folder into the directory of toybox.
3. rename by using ` mv ./linux-* ./linux`
4. `cd ./linux`
5. `make ARCH=x86 allnoconfig`
6. `make ARCH=x86 menuconfig`
7. enshure to select [the following options](build/0.CORE/build/toybox/toybox-0.8.10-i486-minimal.config) as enabled:

````
cat
date
dd
df
du
echo
ls
printf
ps
top
iotop
test
test_glue
uname
dhcp
init
sh
clear
free
slmod
lspci
lsusb
makedevs
mcookie
oneit
reboot
reset
swapoff
swapon
hist
ifconfig
netcat
netstat
ping
wget
hostname
dnsdomainname
killall
mount
pidof
su
sync
umount
roybox
suid
lsm none
uid_sys=100
uid_usr=500

````

8. [Run](build/0.CORE/build/toybox/compile.toybox.sh) ``LDFLAGS=--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- make ARCH=x86 toybox`` and you should end up with an executeable named ``toybox`` in the toybox directory.


---

#
## Building [dbclient](https://matt.ucc.asn.au/dropbear/dropbear.html)

[dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) is a popular implementation of [ssh](https://en.wikipedia.org/wiki/Secure_Shell) that is tested against [OpenSSH](https://en.wikipedia.org/wiki/OpenSSH) and can be tweaked to generat [very tiny binaries](https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2004q3/000022.html).

For our purposes, we only need the client components, and can thus [build dbclient](https://github.com/mkj/dropbear/blob/master/SMALL.md).

##
### Steps

1. [Download](https://matt.ucc.asn.au/dropbear/dropbear.html) the [latest release of Dropbear](https://github.com/mkj/dropbear/releases) and the [``musl-cross`` toolchain]((http://landley.net/toybox/downloads/binaries/toolchains/?C=M;O=D)).
2. Unpack the downloaded tarballs and place the ``musl-cross``-* folder inside the one for dropbear.
3. Rename the folder from dropbear-* into ```dropbear```.
4. Run the [following commands](build/0.CORE/build/dropbear/compile.dbclient.sh) to build dbclient against musl by going into the dropbear folder and running:

``` 
./configure --disable-zlib --disable-x11 --disable-agent-forwarding
LDFLAGS=-W1,--gc-sections,--static CROSS_COMPILE=i486-linux-musl-cross/bin/i486-linux-musl- CFLAGS="-Os -ffunction-sections -fdata-sections" make ARCH=x86 dbclient
```

You should end up with an executeable named ``dbclient`` inside the dropbear folder.

...

// TODO: Expand Documentation. 

---
## Acknowledgements
###
### [Floppinux](https://github.com/w84death/floppinux)
#### [Floppinux Manual](https://archive.org/details/floppinux-manual/)
It has a [pretty detailed and accurate writeup](https://archive.org/download/floppinux-manual/floppinux-manual.pdf) on how to build a minimal Linux that fits in 1.440kB.

---

#### [Back to README](README.md)