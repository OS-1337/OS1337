# Installer
### OS/1337 Installation

---

## Goal
#### Installation Script for a bootable version of OS/1337 on an installed drive.

---

## Steps
#### To install OS/1337
1. Choose the **Edition**
	- As of now, this would basically amount to only ``CORE`` or ``Chonky``.
2. Download the selected **Edition**.
	- Since OS/1337's ``toybox`` only includes ``wget`` w/o SSL/TLS support, it'll likely have to be downloaded via HTTP.
      - Security Issue here: How to check for it being the correct version?
        - CRC'ing isn't really an option nor signature checking - at least not in the ``CORE`` Edition.
3. Writing the Image to disk
   - Basically using ``dd`` to shove it onto a disk.
4. Reboot.

---

