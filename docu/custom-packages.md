# OS/1337
## Custom Packages
### OS/1337 - specific
#### System Configurator
The System Configurator aims to be a user-friendly setup & configuration tool. Similar to [YaST](https://en.wikipedia.org/wiki/YaST) and [tasksel](https://wiki.debian.org/tasksel) it setups most stuff and sanity-checks most settings.
- Package: os1337-systemcfg
- Command: systemcfg
#### Startmenu
This basically acts as the [Startmenu](https://en.wikipedia.org/wiki/Start_menu), similar to [Moo Menu](http://reimagery.com/fsfd/menu.htm#moo) ([archived version](https://archive.org/details/moo31)), providing an easy access to installed applications.
- Package: os1337-menu
- Command: menu
#### Navigator
The Navigator is the toolbar used to switch between programs and screens.
Furthermore it manages the bottom status bar in the last (25th row) similar to the [VT320](https://en.wikipedia.org/wiki/VT320) Terminal and acting as [Taskbar](https://en.wikipedia.org/wiki/Taskbar) similar to "modern" Desktop OSes.
- Package: os1337-nav
- Command: nav
#### Notifications
The Notification-Tool provides notifications as a small applet that is visible in the taskbar.
This includes essentials such as battery level, system mails, etc.
- Package: os1337-notifications
- Command: notif
#### Flusher
This package aims at clearning up RAM whenever it's needed.
Which is useful when dealing with poorly optimized or badly programmed software.
- Package: flushcache
- Command: flush
#### RAMDISK Manager
This tool makes it extremely simple to setup, backup & restore RAMDISKs and manage them, instead of remembering several [manual commands](https://linuxhint.com/create-ramdisk-linux/).
This is extremely handy when it comes handling RAMDISKs and reduces the chances of mistakes.
- Package: ramdisk-manager
- Command: ramdiskm
### Previously unpackaged Software
#### [ntfy](https://ntfy.sh/) - [source](https://github.com/binwiederhier/ntfy)
ntfy [spelled: "notify"] is a server that accepts curl PUT/POST messages and allows retrieval of them, enabling push notifications for CLI tools.
This can be a very useful tool to inform about events.
#### [wsend](https://wsend.net/) - [source](https://github.com/abemassry/wsend)
wsend aims to be "the opposite of wget" allowing users to upload files and retrieve them by sharing a link.
#### [oshi](https://oshi.at/) - [source](https://github.com/somenonymous/OshiUpload)
oshi is an opensourced filehoster that also deduplicates files automatically in the background and also allows further parameters, like limiting the lifespan of a file and setting how many times a file can be downloaded.
