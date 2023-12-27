# "Core" Edition
## OS/1337

---

This is intended to be the same as the main build, or as close as possible. A minimum configuration that fits on a 1440kB 3,5" HD floppy disk.

---

### Scope of the "Core Edition"
#### Be better than Floppinux!

The Core Edition should work as a minimalist Floppy that one can use to install OS/1337 on ``legacy`` systems or at the very least use them and be able to do absolute basics with them. 

- ``Linux`` Kernel 6.6.6
  - Networking Support
    - TCP/IPv4
      - Ethernet
        - ``3Com`` ISA Cards
        - ``AMD`` ISA Cards
        - ``Intel`` ISA Cards
        - ``VIA`` ISA Cards
  - Basic Terminal / Console Support
    - ANSI/ISO ``AT`` QWERTY Keyboard
    - Local 80x25 Terminal
  - Necessary Drivers for ISA support
- ``toybox` Userland 0.8.10
  - Basic Tools
    - ``cat``
    - ``clear``
    - ``date``
    - ``dd``
    - ``df``
    - ``dhcp``
    - ``dnsdomainname``
    - ``du``
    - ``echo``
    - ``free``
    - ``host``
    - ``hostname``
    - ``ifconfig``
    - ``init``
    - ``killall``
    - ``ls``
    - ``lsmod``
    - ``lspci``
    - ``lsusb``
    - ``makedevs``
    - ``mcookie``
    - ``mount``
    - ``netcat``
    - ``netstat``
    - ``oneit``
    - ``pidof``
    - ``ping``
    - ``reboot``
    - ``reset``
    - ``sh`` (``toysh``, a minimalist ``bash`` implementation)
    - ``swapoff``
    - ``swapon``
    - ``su``
    - ``sync``
    - ``uname``
    - ``umount``
    - ``wget`` (w/o ``HTTPS`` support!)
- Dropbear 2022.83
  - ``dbclient`` [compiled as a standalone ``ssh`` client]
- ``kilo``
  - A minimalist Text Editor
