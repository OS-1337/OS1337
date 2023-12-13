#   OS/1337
### Acknowledgements
The labour that others didcontribute or was harnessed in OS71337.

---

## [Linux Kernel](https://kernel.org/)
- To the countless contributors and [maintainers](https://kernel.org/category/releases.html) that make it just easy to download, configure and compile without much fidding. 
  - To all those that keep drivers up and running for old hardware that is definitely vintage. 
  - To those that keep it stable and secure and freely accessible to the world.

###
## [Toybox](https://github.com/landley/toybox)
#### [Rob Landley et. al.](http://landley.net/toybox/)
1. For making a better alternative to [BusyBox](https://en.wikipedia.org/wiki/BusyBox) with a [more permissive license](https://en.wikipedia.org/wiki/BusyBox#Controversy_over_Toybox) known as [0BSD](https://en.wikipedia.org/wiki/BSD_licenses#0-clause_license_(%22BSD_Zero_Clause_License%22)), with an [in-depth explainer why](http://landley.net/toybox/license.html).
2. Excellent documentation on [how to build & cross-compile it from source](http://landley.net/toybox/quick.html), [the code written](http://landley.net/toybox/code.html) and a good [online manpage that shows what every command does](http://landley.net/toybox/help.html).
3. Being patient and willing to answer [noob-ish questions on my part](https://github.com/landley/toybox/issues/451).

###
## [musl C-library](https://musl.libc.org/)
### musl-cross toolchain
- Thanks again to Rob Landley for providing [ready-to-roll musl-cross binaries and tarballs](http://landley.net/toybox/downloads/binaries/toolchains/latest/).

###
## [SYSLINUX](https://wiki.syslinux.org/wiki/index.php?title=The_Syslinux_Project)
For being a [functioning bootloader](https://en.wikipedia.org/wiki/SYSLINUX) that just works on Floppies or basically anything.

##

---

## Notable mentions
These are mostly projects that inspired me to give it a go.

####
### [Floppinux](https://github.com/w84death/floppinux)
#### Krzysztof Krystian Jankowski et. al.
- For [documenting how Floppinux was being built in a reproduceible manner](https://archive.org/details/floppinux-manual/).
  - It pretty much got me [very far](https://mstdn.social/@kkarhan/111409592616485280) in the development cycle of OS/1337.

####
### [tmsrtbt](https://en.wikipedia.org/wiki/Tomsrtbt)  
##### (spelled: *"Tom's Root Boot"*)
A [sadly unmaintained](http://www.toms.net/rb/) Linux Distribution designed to fit on a 3,5" 1.440 kB FDD.

####
### [floppyfw](https://en.wikipedia.org/wiki/Floppyfw)
A minimalist Busybox/Linux distro that could turn any [i386-SX](https://en.wikipedia.org/wiki/I386#80386SX) with 12MB RAM, 2 NICs and a 1440kB FDD into a functional firewall. 

####
### [Aboriginal Linux](http://landley.net/aboriginal/)
A minimalist Busybox/Linux Distribution maintained by Rob Landley (the ex-maintainer of BusyBox and [now-maintainer of toybox](http://landley.net/toybox/)) which aimed to be the smallest, "self-hosting" aka. self-compiling Linux Distribution.

#### 
### [mkroot](https://github.com/landley/mkroot)
The Successor Project of Aboriginal Linux which [has been marged into toybox since 2020.](https://github.com/landley/toybox) 

#### 
### [Firmware Linux](https://landley.net/code/firmware/old/)
A similar project to Aboriginal Linux but predating it.

#### 
### [ttylinux](http://www.minimalinux.org/ttylinux/)
A minimalist Linux distro that only needs 8MB of storage and 28MB of RAM, but uses [regular linux components](http://www.minimalinux.org/ttylinux/about.html) like glibc, bash and so forth.

####
### [TinyCore Linux](https://en.wikipedia.org/wiki/Tiny_Core_Linux)
Being a [very smol and nifty distro](http://tinycorelinux.net/) abeit with way more space to work work.
- It's also available with [Xorg](https://en.wikipedia.org/wiki/X.Org_Server) for a fancy [GUI Desktop](https://en.wikipedia.org/wiki/Graphical_user_interface#Popularization).

####
### [Damn Small Linux](https://en.wikipedia.org/wiki/Damn_Small_Linux)
For being one of the first Linux Distros I tried and that saved my friends-, customers-, and employers' asses countless times.
- Nowadays I'm a bit more lazy and use [Rescatux](https://www.supergrubdisk.org/category/download/rescatuxdownloads/rescatux-stable/) instead.
##### See also: [SystemRescueCD](https://www.system-rescue.org/)

####
### [Knoppix](https://en.wikipedia.org/wiki/Knoppix)
Being [the go-to](https://www.knopper.net/knoppix/index-en.html) ["LiveCD"](https://en.wikipedia.org/wiki/Live_CD) to work with.


###
### [BunsenLabs Linux](https://en.wikipedia.org/wiki/CrunchBang_Linux#BunsenLabs)
Showcasing that a [minimal yet nice Desktop for 32bit/ix86 was still useful and in demand](https://www.bunsenlabs.org/installation.html).

###
### [Ubuntu](https://ubuntu.com/)
- Both [Ubuntu LTS Server](https://ubuntu.com/download/server) and [Ubuntu LTS Desktop](https://ubuntu.com/download/desktop) as they are my go-to OSes to work on that are [reliable and don't get viruses or crashes or cause a ton of headaches](https://www.youtube.com/watch?v=0eEG5LVXdKo&t=1752s).
  - Whilst [Ubuntu Core](https://ubuntu.com/core) may be a good solution for a lot of [IoT](https://ubuntu.com/download/iot) devices and projects, 

###
### [VxWorks](https://www.windriver.com/products/vxworks)
- Utilizing the same approach as used for OS/1337 by having a [seperate development envoirment on different Hardware than the target system.](https://en.wikipedia.org/wiki/VxWorks#Development_environment)
  - This is done out of convenience and to allow the use of development tools outside of those supported on OS/1337.
    - OFC it's desireable to have OS71337 *self-hosting* tho as of now this is not regarded with as high of a priority than for toybox.

###
### [Wind River Linux](https://www.windriver.com/products/linux)
- Which can be considered to be similar abeit as a commercial solution with [one time purchase for licensing per project](https://en.wikipedia.org/wiki/Wind_River_Systems#Wind_River_Linux)
  - OFC in that regard it's not dissimilar from [RHEL](https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux), [SLES & SLED](https://en.wikipedia.org/wiki/SUSE_Linux_Enterprise) being an Enterprise Linux Distribution.
- The "Free" version is just "Yocto Linux" from [Yocto Project](docu/acknowledgements.md)#Yocto)

###
### [Yocto Project](https://www.yoctoproject.org/)
- Being the official solution by the [Linux Foundation](https://www.linuxfoundation.org/) to build and create embedded Linux for IoT devices.
  - It still relies on the same GNUtils and libraries and thus is problematic for use-cases that don't play nice with CCSS as per their [copyleft](https://en.wikipedia.org/wiki/Copyleft) licensing, most notable [GPLv3](https://en.wikipedia.org/wiki/GNU_General_Public_License#GPLv3_criticism).
    - One of the reasons to use [toybox](https://en.wikipedia.org/wiki/Toybox#History) over [BusyBox](https://en.wikipedia.org/wiki/BusyBox#GPLv2/GPLv3_controversies) which [Rob Landley pointed out in great lenghts](https://www.youtube.com/watch?v=MkJkyMuBm3g#t=1m18s).
    - Not to mention [GNUtils](https://en.wikipedia.org/wiki/GNU_Core_Utilities) require way more storage than necessary.

###
#### Various other tools I use that just work out of the box:
- [mkdosfs](https://linux.die.net/man/8/mkdosfs)
- [dd](https://linux.die.net/man/1/dd)
- [GCC](https://en.wikipedia.org/wiki/GNU_Compiler_Collection)

---

#### [Back to README](README.md)