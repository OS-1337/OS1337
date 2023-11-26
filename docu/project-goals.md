# OS/1337
### Project Goals

---
### Primary
#### Create A minimalist toybox/Linux + musl distribution
- Support [i486](https://en.wikipedia.org/wiki/I486) hardware 
  - very ubiquitous and easy to test
- Get the "CORE" system to fit on a single [1.440kB 3,5" Floppy Disk](https://en.wikipedia.org/wiki/Floppy_disk#3%C2%BD-inch_floppy_disk).
#### Core Functionality:
- [Linux](https://en.wikipedia.org/wiki/Linux) [Kernel](https://kernel.org/)
- [Toybox](https://en.wikipedia.org/wiki/Toybox) [Userland](https://en.wikipedia.org/wiki/User_space_and_kernel_space)
- [dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) [- or to be precise: [dbclient](https://github.com/mkj/dropbear/blob/master/MULTI.md), the SSH Client component]
  - Allow for username + password - based SSH logins.
    - Basically turning a system into a "SSH Terminal"

---
### Secondary
#### Expand the Scope without bloating it!
- Add support for amd64 and arm11v5 / rpi0
  - ubiquitous and not too challenging to test
- Keep the "BASE" system as tiny as possible.
  - It has to fit on a 25 MB "Business-Card" Mini-CD.
---
### Tetriary
#### Add more packages.
- Add support for arm64
- Keep the "MAIN" system as tiny as possible.
  - It has to fit on a 170 MB 80mm "Mini-CD".
- Keep the entire repository small and efficient.
- Keep the "XTRA" system as tiny as possible.
  - It has to fit on a 600 MB "Business-Card" Mini-DVD.
- The entire sources should fit on a 1.300 MB Mini-DVD.
  - All Supported Architectures should fit on a 2.500 MB Mini-DVD-DL.
---
### Long-Term Backlog
#### Add support for [more architectures](./ideas/architectures.tsv).

---

#### [Back to README](README.md)