#	OS/1337	
### A minimalist yet useable, CLI-Oriented Toybox/Linux Distribution.
##

---

### INDEX
- #### [Getting Started](docu/getting-started.md)
- #### [Building OS/1337](docu/building.md)
- #### [Project Goals](docu/project-goals.md)
- #### [Roadmap](docu/roadmap.md) for OS/1337 development
- #### [Acknowledgements](docu/acknowledgements.md) of external helpers
- #### [Further Sources](docu/further-sources.md) to read into
- #### [License](LICENSE.md)
  - TLDR: It's [0BSD](https://en.wikipedia.org/wiki/BSD_licenses#0-clause_license_(%22BSD_Zero_Clause_License%22)) as created by Rob Landley [and used for toybox](http://www.landley.net/toybox/license.html).
    - ###### Please note that [this does not apply to all parts of OS/1337 - notably the Linux Kernel!](LICENSE.md#important-note)

---

##	Core Features
### [TUI (GUI but in CLI!)](https://en.wikipedia.org/wiki/Text-based_user_interface) - based interface
#### "Make Terminals Great Again!"
80x25 terminal (per default) with options to even run in 80x24
- 25th line is used as menu- / navigation- / statusbar
  - as [customary from Terminals like the DEC VT320](https://youtu.be/RuZUPpmXfT0?t=208)
####
### Resource-Efficient
#### "Less is more!"
- Lack of X.org/Wayland/... and 'bloated' GUI apps per default make it extremely low-power friendly.
- Can run on [extemely low powered systems]((https://en.wikipedia.org/wiki/Light-weight_Linux_distribution#Comparison)).
  - [Can be run entirely from RAM](https://en.wikipedia.org/wiki/List_of_Linux_distributions_that_run_from_RAM)
##

---
## [Roadmap](docu/roadmap.md)
#### OS/1337 is still in early development and has yet to make an initial release.

--- 
## [Components](docu/ideas/components.md)
Besides the basic core system, it's kept very lean just to enshure it's not bloated, with only concessions being made to reduce avoidable and burdensome inconveniences and incompatibilities.
###

### [Linux Kernel](https://kernel.org)
Simply because a battle-tested, well maintained, versatile and with ample drivers equipped Kernel exists and rewriting it solely for the purpose of not using it is at best childish if not foolish. 
- OFC there are various other kernels that could also be used, like the ones of OpenBSD & FreeBSD or even Illumos [nee OpenSolaris] but that would just exceed the scope of this project. Feel free to DIY tho...
  - Linux as a Kernel however has by far the most versatile support for architectures and hardware installed.
###

### [Toybox Userland](https://landley.net/toybox/)
Simply because the absolute bare-minimum System should comfortably fit on a 1.440kB FDD.
- Toybox also [includes the most essential functions and tools](https://landley.net/toybox/help.html) so the [bare minimum system is the Toybox binary which would include the Kernel and C library](https://landley.net/toybox/faq.html#cross). 
  - Not to mention [Toybox is easy to setup](https://landley.net/toybox/faq.html#install) [and build from scratch](https://landley.net/toybox/faq.html#mkroot), which is desireable for those wanting a system that can be audited at a lower cost. 
    - OFC one could use [BusyBox](https://www.busybox.net/) or even a *BSD [Userland](https://en.wikipedia.org/wiki/User_space_and_kernel_space) if they so desire...
      - But that's NOT THE SCOPE OF THIS PROJECT!
###

### [musl C Library](https://musl.libc.org/)
Because [Glibc](https://en.wikipedia.org/wiki/Glibc) is a mess that tends to brick systems at the slightest minor version update, basically requiring recompilation or everything.
- This is totally impractical for anyone having to work with [CCSS](https://en.wikipedia.org/wiki/Proprietary_software) aka. [Commercial Closed Source Software](https://en.wikipedia.org/wiki/Commercial_software) and thus only gets binaryblobs to execute.
  - Also [uClibc](https://en.wikipedia.org/wiki/UClibc) and uClibc-ng are basically Abandonware at this point.
###

### [spm - Simple Package Manager](https://github.com/OS-1337/spm)
After all, even a simplistic system should have the ability to install and uninstall applications.
- It's very bare-bones, but it does it's job... 
  - And yes it's a fork of [SSPM](https://github.com/SuperSimplePackageManager/SSPM).
###

### [pkgs - Repository](https://github.com/OS-1337/pkgs)
Because a Package Manager without Repository is pretty much pointless.
- Even tho it mostly contains just binaries to *yoink* and use.
###

### [default configurations](https://github.com/OS-1337/conf.d)
To allow for easier setup and customization...
- Also helps finding misconfigurations.
###

### [sources links](https://github.com/OS-1337/dl.srcs.d)
To enable reproducible builds and spins.
- Furthermore delivering transparency.

---
## [Project Goals](./docu/project-goals.md)

##	Target Devices
### [Supported Architectures are listed here.](./docu/ideas/architectures.tsv) 
- To be used on Systems that are being accessed via Terminals like:
  - [DEC VT320](https://www.youtube.com/watch?v=RuZUPpmXfT0)
  - [violence.works VT-69](https://www.youtube.com/watch?v=wYfpptgb6W8)
- "Slim Clients"  & "Thin Clients"
  - [hp t620](https://support.hp.com/us-en/document/c04017240)
    - OFC that thin client is still fast enough to run BunsenLabs Linux and Tails but that doesn't mean it'll remain this way for very long...
- Legacy Systems too slow or never designed to even run any GUI
  - [Netbooks](https://en.wikipedia.org/wiki/Netbook)
    - [VAIO P series](https://en.wikipedia.org/wiki/Sony_Vaio_P_series) 
      - [Sony VAIO P11Z](https://www.notebookcheck.net/Sony-Vaio-VGN-P11Z-G.14468.0.html) 
          - Mostly due to Intel's Fuckup that is the [GMA500](https://www.intel.com/content/www/us/en/support/products/81506/graphics/legacy-graphics/intel-graphics-media-accelerator-500-intel-gma-500.html) Onboard-GPU.
    - [VIA OpenBook](https://en.wikipedia.org/wiki/VIA_OpenBook)
- Select SoC's and Embedded as well as legacy devices.
  - [Raspberry Pi Zero](https://www.raspberrypi.com/products/raspberry-pi-zero/) [W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/)
  - more depending on whether or not someone wants to build for and maintain them.

In theory it could also be used as a "Rescue System" or similar, but there are better tools out there like [Rescatux](https://www.supergrubdisk.org/rescatux/) and [Trinity Rescue Kit](https://trinityhome.org/).
#### See [Project Goals](docu/project-goals.md) for OS/1337
##

---
##	Target Audience
### Expedient Linux Users and *nix enthusiasts.
#### This is basically ["Hard Mode Linux"](https://www.youtube.com/watch?v=_Ua-d9OeUOg&t=117s) and if you're scared by looking at a terminal window or seeing someone using it, then you are NOT ALLOWED to use it!
Please realize that this isn't intended for people freshly switching to Linux.
- Unless you have like decades of Unix Experience, this will be hard.
  - Espechally since this is is an [Embedded Linux Distribution](https://en.wikipedia.org/wiki/Linux_on_embedded_systems), not a mainsteam distro, and is thus closer to [ELKS](https://en.wikipedia.org/wiki/Embeddable_Linux_Kernel_Subset) than Debian.

So please shift your expectation accordingly!

### People who demand a tiny Linux distro that is yet still useable.
#### DO NOT (!!!) expect The amount of Software and Support you'll find for [Ubuntu](https://ubuntu.com/) or any other mainsteam distro here.
If you just want a lightweight & Portable Desktop OS, consider [Tails](https://tails.net/), [BunsenLabs Linux](https://www.bunsenlabs.org/) or if you want something for guest and strangers to use, [Porteus Kiosk](https://porteus-kiosk.org/).
- OS/1337 wants to make [TinyCore](http://www.tinycorelinux.net/) look "phat" in comparison.
  - OFC this is achieved by virtue of sacrificing a Xorg/Wayland-based GUI!

#### In fact, the "core" system is just [toybox](http://www.landley.net/toybox/)/[Linux](https://kernel.org) + [musl](https://musl.libc.org) with [dbclient](https://github.com/mkj/dropbear/blob/master/SMALL.md), the [SSH Client](https://en.wikipedia.org/wiki/Secure_Shell)-part of Dropbear.
- The "base" system only adds [dropbear](https://github.com/mkj/dropbear), [enc](https://github.com/life4/enc), [ne](https://github.com/vigna/ne) and [nail](https://sourceforge.net/projects/nail/).
- The "main" system offers [tmux](https://github.com/tmux/tmux), [curl](https://curl.se/download.html), [lynx](https://lynx.invisible-island.net), [aerc](https://git.sr.ht/~rjarry/aerc), [btop](https://github.com/aristocratos/btop), [mc](https://midnight-commander.org/), [aria2](https://github.com/aria2/aria2) on top of that.
- The "xtra" system then includes all packages except "servers" and "development tools".
##### A [list of all packages can be found here.](docu/pkgs/src.pkgs.list.tsv)
 
### Counter-Indications
#### Please refrain from using OS/1337 if you just want to "Fuck Around and Find Out"!
###### This goes espechally to [Linus Sebastian of LinusTechTips](https://news.itsfoss.com/more-linux-distros-become-linus-proof/) who has weapons-grade ["Tech-Illiteracy"](https://www.youtube.com/watch?v=pYQtusd8deU) [unsarcastically!] and a [toxic followership](https://old.reddit.com/r/LinusTechTips/comments/t1e1if/you_destroyed_my_life/) to flex!
#### OS/1337 is not a "DOS"!
##### Not everything that has a Text Interface is an "MS-DOS clone"!
Your experience with any *DOS won't help you here...
###### [Please use FreeDOS instead.](https://www.freedos.org/)
##

---
## [Acknowlegements](docu/acknowledgements.md)

### Name
#### OS/1337 
It's a wordplay upon [OS/2](https://en.wikipedia.org/wiki/OS/2), [OS/360](https://en.wikipedia.org/wiki/OS/360_and_successors), [OS/390](https://en.wikipedia.org/wiki/OS/390) & [z/OS](https://en.wikipedia.org/wiki/Z/OS).
- Naming it OS/3 or OS/420 was deemed too risky from a trademark standpoint, and one could reason it's meant to spread confusion among users of OS/2 or the OS/360 - z/OS family.
  - Exacerbated by the fact that it's neither made nor endorsed by [IBM](https://en.wikipedia.org/wiki/IBM) and doesn't support the same [z/Architecture](https://en.wikipedia.org/wiki/Z/Architecture) as the aformentioned Mainframes.
- It's a homage to old terminal Systems as well as to the clichee of "Hackers" that must always work with amber and/or green consoles on their ThinkPads and MacBooks wearing Fawkes Masks and black Hoodies.
###

### Inspirating Project
#### [Floppinux](https://github.com/w84death/floppinux)
Floppinux is a minimalist Linux distro designed to run from a single 3,5", 1440 KB Floppy Disk.
- It's based on BusyBox and a current Linux Kernel.
  - But strips basically most of the unused features out of it.
###

---
## "Shut Up And Let Me Download!"
### "Sharing is Caring"
Ready-to-Use Binary Versions are [only distributed via magnet: links](https://en.wikipedia.org/wiki/Magnet_URI_scheme) over [BitTorrent](https://en.wikipedia.org/wiki/BitTorrent) in order to enshure resilient availability and speed for everyone.
- Just use [Transmission](https://transmissionbt.com/) or [LibreTorrent](https://f-droid.org/en/packages/org.proninyaroslav.libretorrent/) for Downloading if you don't know how.
  - If your ISP blocks BitTorrent get rid of your ISP or use a VPN.
- Just don't be antisocial and use Tor to Torrent because all you'll do is exhaust valuable bandwith of exit nodes whilst compromizing your own anonymity.
  - This is free software, not some pirated stuff!
    - If you think BitTorrent has no "legitimate use" then you are banned from using OS/1337.
  - Same goes for those that just download from the severely bandwith-restricted webseed and/or only leech the torrent.
###

### And before anyone asks:
#### YES we are aware of [ClownFlare](https://en.wikipedia.org/wiki/Cloudflare#Kiwi_Farms) existing.
  - [Liz Fong-Jones has done a pretty good 3 part explainer series why you should never use them at all](https://www.youtube.com/watch?v=Np9erdnM4l8&list=PLI84-gNHkUdvE1u_Kfz3qS9h75n-m-T3y&pp=iAQB) and in a way more concise and understandable form without ranting than I could do.
    - After all, [the current maintainer](https://twitter.com/k3vk4/status/1562956359686971392) pushed for [#DropKiwifarms](https://github.com/greyhat-academy/lists.d#why-use-it) on other occasions.
##### We won't solve scalability issues by creating de-facto monopolists or oligopolists!
- Espechally if these are [knowingly and willingly supporting Terrorism by their own admission](https://en.wikipedia.org/wiki/Cloudflare#Terrorism)  and are [more part of the Problems than Solutions](https://en.wikipedia.org/wiki/Cloudflare#Crime).
  - ["Protecting the Good Guys for free"](https://en.wikipedia.org/wiki/Cloudflare#Response_to_the_Russian_invasion_of_Ukraine) doesn't make said business less of a [protection racket](https://en.wikipedia.org/wiki/Protection_racket) as they knowingly and willingly also host [attackers wanting to extort others for ransom](https://en.wikipedia.org/wiki/Denial-of-service_attack#DDoS_extortion).
###### Otherwise it would be pretty ridiculous to advocate for decentralization, multi-vendor & multi-provider solutions if not done so in real life, because one would otherwise [contribute to the increasing Enshittification of the the Internet](https://en.wikipedia.org/wiki/Enshittification).
###

---

## [Further Reading](docu/further-sources.md)

## See Also:
#### [Prof. Wim Vanderbauwhede](https://labs.ripe.net/author/anastasiya-pak/frugal-computing-for-a-sustainable-internet/)
[Frugal Computing](https://arxiv.org/pdf/2303.06642v1.pdf)
