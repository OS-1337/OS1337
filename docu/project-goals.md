# OS/1337
### Project Goals

---
### Primary
#### Create A minimalist toybox/Linux + musl distribution
- Support amd64 hardware 
  - very ubiquitous and easy to test
- Get the "CORE" system to fit on a 720kB 3,5" Floppy Disk
  - If that's not possible, a 1.440kB 3,5" Floppy Disk
---
### Secondary
#### Expand the Scope without bloating it!
- Add support for ix86 and arm11v5 / rpi0
  - ubiquitous and not too challenging to test
- Keep the "BASE" system on a 1.440kB 3,5" Floppy Disk
  - If that's not possible, a 2.880kB 3,5" Floppy Disk
---
### Tetriary
#### Add more packages.
- Keep the "MAIN" system as tiny as possible.
  - It has to fit on a 25 MB "Business-Card" Mini-CD.
- Keep the "XTRA" system as tiny as possible.
  - It has to fit on a 170 MB 80mm "Mini-CD".
- Keep the entire repository small and efficient.
  - All packages for a single architecture have to fit on a 600 MB "Business-Card" Mini-DVD.
  - The entire sources should fit on a 1.300 MB Mini-DVD.
  - All Supported Architectures should fit on a 2.500 MB Mini-DVD-DL.
---
### Long-Term Backlog
#### Add support for [more architectures](./ideas/architectures.tsv).
