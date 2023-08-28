# OS/1337
### Project Goals

---
### Primary
#### Create A minimalist toybox/Linux + musl distribution
- Support i486 hardware 
  - very ubiquitous and easy to test
- Get the "CORE" system to fit on a single 1.440kB 3,5" Floppy Disk.
#### Core Functionality:
- Linux Kernel
- Toybox Userland
- dropbear [- or to be precise: dbclient, the SSH Client component]
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
