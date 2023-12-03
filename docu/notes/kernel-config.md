# OS/1337
### Issue Analysis re:  non-booting issue
## Kernel Configuration Comparisons

---

### Based off [Debian Kernel Config](docu/external/debian/config) vs. [existing Kernel Config](build/0.CORE/build/linux/linux-6.6.1-i486-minimal.config)


1.  ``CONFIG_PHYSICAL_ALIGN=0x1000000`` vs. ``CONFIG_PHYSICAL_ALIGN=0x200000``
2. ``CONFIG_PAGE_OFFSET=0xC0000000`` not defined on Debian Kernel, but set on existing config.
3. ``CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y`` not defined on Debian Kernel, but set on existing config.
4. ``# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set`` not defined on Debian Kernel, but set on existing config.
5. ``CONFIG_INITRAMFS_SOURCE=""``not defined on Debian Kernel, but set on existing config.

6. 
```
CONFIG_DEFAULT_INIT="/bin/toybox"
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
```
not defined on Debian Kernel, but set on existing config.

7. ``CONFIG_X86_GENERIC=y`` is set on Debian Kernel, but not on existing config.

---

### Based off [Floppinux Configuration Guide](docu/external/floppinux/floppinux-manual.pdf)

#### Steps are:
```
make ARCH=x86 tinyconﬁg
make ARCH=x86 menuconﬁg
make ARCH=x86 bzImage
```

``menuconfig`` settings to be enabled are the following:
```
Processor type and features > Processor family > 486
Device Drivers > Character devices > Enable TTY
General Setup > Conﬁgure standard kernel features (expert users) > Enable support for printk
General Setup > Initial RAM ﬁlesystem and RAM disk (initramfs/initrd)
Executable ﬁle formats > Kernel support for ELF binaries
Executable ﬁle formats > Kernel support for scripts starting with #!
```

---

## TODO: Find solution to boot issue!

---

---
