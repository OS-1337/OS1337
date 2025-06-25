#   OS/1337
### Architecture Guide

This is a guide to how OS/1337 has been designed, what the design goals are and how they are being achieved.

---

##	Goals

###
### 1. Creating the Smallest possible yet still useable Linux system.

Small systems like [Floppinux](https://github.com/w84death/floppinux) are nice, but unless they also have some tools they are mostly a [*"demoscene"*](https://en.wikipedia.org/wiki/Demoscene)-esque exercise on how little space one needs to get things on a screen.
- Whilst it comes with a [good documentation](https://archive.org/details/floppinux-manual) we [archived here as well](docu/external/floppinux/floppinux-manual.pdf) it's not a useable system in that it allows one to do anything with it but put characters on a screen. 
  - This can be done *way better* as [Rob Landley](http://landley.net/toybox/), maintainer of [toybox](https://github.com/landley/toybox) [pointed out in a hands-on tutorial](https://www.youtube.com/watch?v=Sk9TatW9ino).

*Smallness* implies if not *necessitates* the use of simple and compact solutions that are space-efficient.
Cutting corners in terms of functionality is thus a necessity.
- Kernel: [``linux``](https://kernel.org/) - since it's easy to build and has the widest support in terms of Hardware.
  - Drivers: Only 80x25 MDA console, PC beeper and *essential* stuff to be bootable and get basic access to storage and networking.
- Userland: [toybox](https://github.com/landley/toybox), which also includes most of the essential tools to get a system up and running.
  - Which is illustrated with [``mkroot``](https://github.com/landley/toybox/blob/master/mkroot/README), a fully fledged *toybox + musl / linux Distribution* that takes up less than 5 MB.
  - C library: [musl](https://en.wikipedia.org/wiki/Musl) - more specifically [musl-cross](https://landley.net/bin/toolchains/latest/).
    - All binaries are statically linked against it to avoid *"dependency hell"* !
- Bootloader: Originally [``syslinux``](https://wiki.syslinux.org/wiki/index.php?title=The_Syslinux_Project), but currently switching over to [``mlb``](https://github.com/OS-1337/mlb).
  - The ``initramfs.cpio.xz`` has to be integrated into the Kernel ``bzImage``.
- Additional Software:
  - [``kilo``](https://github.com/antirez/kilo), a lightweight text editor.
  - [``dropbear``](https://github.com/mkj/dropbear) - more specifically [```dbclient```](https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2004q3/000022.html) as [SSH](https://en.wikipedia.org/wiki/Secure_Shell#OpenSSH_and_OSSH) client.
- Optional Software:
  - [``spm``](https://github.com/OS-1337/spm) as a *simple* [Package Manager](https://en.wikipedia.org/wiki/Package_manager) to add and remove programs and expand OS/1337 from the "[``CORE``](build/0.CORE) Edtion" onwards.
    - A [repository](https://github.com/OS-1337/pkgs) to get the most needed packages easily.

###
### 2. Make a fully reproduceable and auditable System.

Whilst in theory *"everything with available sourcecode can be audited"*, it's vital to make this feasible.
- Noone's gonna audit the entire GNU/Linux stack because that's [way too expensive - even for NORAD](https://www.youtube.com/watch?v=MkJkyMuBm3g&t=715s).

This means avoiding complexity and *bloat* even at the cost of functionality.

###
###	3. Make it available under a [*permissive license*](https://en.wikipedia.org/wiki/Permissive_software_license) to increase adoption.

This is done by choosing [0BSD](https://en.wikipedia.org/wiki/BSD_licenses#0-clause_license_(%22BSD_Zero_Clause_License%22)) as [license](LICENSE.md).
- Not every juristiction (i.e. Germany) recognizes *"Public Domain"* as a form of license (since one cannot legally disavow *Authorship*), so [the next best thing](https://www.youtube.com/watch?v=MkJkyMuBm3g&t=2030s) is neessary.

[GPLv3](https://en.wikipedia.org/wiki/GNU_General_Public_License#Version_3) is extremely toxic to the point that it even harms GPLv2-only projects!
- [Copyleft](https://en.wikipedia.org/wiki/Copyleft) fails at [attracting contributions and funding](https://www.youtube.com/watch?v=MkJkyMuBm3g&t=1607s) and enforcing it in a *hamfisted* approach is [evidently counterproductive](https://www.youtube.com/watch?v=MkJkyMuBm3g&t=302s).
  - Escalating it into *"Asshole Licensing"* like [AGPLv3](https://en.wikipedia.org/wiki/GNU_Affero_General_Public_License) and [SSPL](https://en.wikipedia.org/wiki/Server_Side_Public_License) is just an act of spite and completely disregards the reality of both IP and patent laws!

###
###	4. [Document it](docu/architecture.md) so well that it's build process and [Architecture](docu/system-image-architecture.pdf) is understandable with minimal learning.

This not only applies to *commenting code*, but writing documentation so people can *manually build it from scratch* on a modest build envoirment.
- This is done to not just aid *reproduceability*, *auditability* and *simplicity* but provide *trust through transparency*.

It should be possible to answer *"Why?"* for every line of code just by common sense, technical dependency and documentation alone.

---

##  Unique Architectural differences of OS/1337
Due to it's simple nature, OS/1337 doesn't implement a lot of features known from other Linux distros.
- This is in part intentional, in other ways a necessary sacrifice due to space constraints and complexity concerns.
  - The closest compareable "distro" it is (*the de-facto upstream*) `mkroot` of `toybox`.

###
### Runlevels
Unlike most Linux distributions, OS/1337 has [fewer runlevels](https://en.wikipedia.org/wiki/Runlevel#Linux) and per default only boots into `Runlevel 1` with a single-user (`root`) Non-GUI shell.
- See [`/etc/init`](build/0.CORE/fdd/fs/etc/init) in the filesystem.

####  Startup
OS/1337 literally boots by loading it's [`initramfs`](build/0.CORE/fdd/fs) (usually as [`rootfs.cpio.xz`](build/0.CORE/fdd/rootfs.cpio.xz)) and Kernel (usually [`bzImage`](build/0.CORE/fdd/bzImage)  if not a unified `OS1337b`) and kicking off the startup sequence.
- It'll then autostart with it's [`init file`](build/0.CORE/fdd/fs/etc/init) including splashing the [`welcome message`](build/0.CORE/fdd/fs/welcome.txt).
- After that, [toybox](build/0.CORE/fdd/fs/bin/toybox)'s `toysh` (a minimalist, [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))-compatible shell) is being launched to provide main access.
  - This is essentially [Runlevel 1 as per LSB 4.1.0](https://en.wikipedia.org/wiki/Runlevel#Linux).
- It may be intentional on expanded releases of OS/1337 to boot straight into Runlevel 3.
  - However this will not apply to the [`"CORE" Edition`](build/0.CORE) due to space constraints.

##### init system
Per default, OS/1337 uses a single [`init file`](build/0.CORE/fdd/fs/etc/init) (alongside [`inittab`](build/0.CORE/fdd/fs/etc/inittab) & [`profile`](build/0.CORE/fdd/fs/etc/profile)) instead of a more complex init system.
- Support for [SysVinit](https://en.wikipedia.org/wiki/Init#SysV-style) and [systemd](https://en.wikipedia.org/wiki/Systemd) is possible but currently are not in scope.

##### extending the configuration
You may want to extend and add additional services to be started automatically to your OS71337 installation.
- To do so, you can add another shell session in `/etc/init` by adding `/bin/toybox oneit -rn -c /dev/console /bin/$service/startup.sh`, where `$app` is the service in question.
  - It is recommended to use dedicaded subfolders in `/bin/` for ease of maintenance.

###
### Applications and packages
`#TODO`

####  Graphical Desktops
OS/1337 is explicitly designed to run in [MDA](https://en.wikipedia.org/wiki/IBM_Monochrome_Display_Adapter) (80x25) text mode.
- Support for a GUI (regardless if [Xorg](https://en.wikipedia.org/wiki/X.Org_Server) or [Wayland](https://en.wikipedia.org/wiki/Wayland_(protocol)) is *explicitly out of scope* for this project!)
- The use of [`ncurses`](https://en.wikipedia.org/wiki/Ncurses) to build [`TUI`](https://en.wikipedia.org/wiki/Text-based_user_interface)-based applications is recommended.

####  Dependencies & Libraries
Applications must statically link their dependencies (or put them in their own subfolder within `/bin/$appname/` directory for that reason alone).
- There are *no shared libraries* on OS/1337!
