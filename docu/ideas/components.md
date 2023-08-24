
##  Component List
####    See also [Packages](packages.list.tsv)
### User Interface
  - [Fish](https://fishshell.com/) Shell for maximum user-friendlyness.
    - [Bash](https://www.gnu.org/software/bash/) Shell is only kept for compatibility and scripting reasons.
  - [tmux](https://github.com/tmux/tmux/wiki)
    - Because tiling window managers are good - and tiling terminals are better. 
    - Allows for switching between applications and flexible, on-the-fly adjustment of the terminal.
  - [Dialog](https://en.wikipedia.org/wiki/Dialog_(software)) for any interactive configuration.
  - [tasksel](https://wiki.debian.org/tasksel)-alike setup.
  - a [Moo Menu](https://archive.org/details/moo31)-inspired "Startmenu" / Homescreen for fast and easy access to files and tools.
  - an extensive list of preconfigured [aliases](https://bash.cyberciti.biz/guide/~/.bash_aliases) and [Functions](https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions). 
    - detecting drives & filesystems as well as (dis-)mounting them.
    - creating a [RAM-Disk](https://linuxhint.com/create-ramdisk-linux/) as well as backing up & restoring data to and from it.
###  Essentials for Users
  - [OpenSSH](https://www.openssh.com/) Client & Server
  - [GnuPG](https://www.gnupg.org/) ForEncryption and Authentification via Digital Signatures
  - [btop](https://github.com/aristocratos/btop) system monitor.
  - Communication
    - [Lynx](https://en.wikipedia.org/wiki/Lynx_(web_browser)) Browser
    - [mutt](https://en.wikipedia.org/wiki/Mutt_(email_client)) eMail Client
    - [WeeChat](https://weechat.org/) IRC Client
    - [Profanity](https://profanity-im.github.io/) XMPP Client
    - [Zulip Terminal Client](https://github.com/zulip/zulip-terminal)
###	Various Backup & Restore tools
  - [duplicity](https://duplicity.us/)
   - [borg](https://www.borgbackup.org/)
   - [rdiff-backup](https://rdiff-backup.net/)
   - [pax](https://en.wikipedia.org/wiki/Pax_(command))
     - [tar](https://en.wikipedia.org/wiki/Tar_(computing)) is being shipped for compatibility purposes.
   - [bzip2](https://en.wikipedia.org/wiki/Bzip2) for efficient compression.
### Core Components
  - Kernel
    - [Linux Kernel](https://kernel.org/) 
      - LTS Versions prefered
  - System Managment & Init
    - [SystemD](https://systemd.io/)
      - Because noone wants to suffer through SystemVinit. 
        - Also because it's superior.
  - Bootloaders
    - [SystemD-Boot](https://wiki.archlinux.org/title/Systemd-boot) on (U)EFI-based systems.
    - [GRUB2](https://wiki.archlinux.org/title/GRUB) on non-(U)EFI - Systems.
    - [U-boot](https://elinux.org/RPi_U-Boot) on SBCs and other devices.
    - [isolinux](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX) for [LiveCD](https://en.wikipedia.org/wiki/Live_CD) & [LiveUSB](https://en.wikipedia.org/wiki/Live_USB) systems.
  - Userland
    - [BSD Userland & Toolchain](https://github.com/dcantrell/bsdutils)
      - [Clang](https://clang.llvm.org/)/[LLVM](https://llvm.org/)
### Filesystem Support
  - [OpenZFS](https://openzfs.org/wiki/Main_Page) support. 
    - Simply because ZFS is an excellent filesystem for huge amounts of data. 
      - Tho the system will usually default to ext4 with ext2 as option to reduce writes and keep performance good.
  - [UFS](https://en.wikipedia.org/wiki/Unix_File_System), [LTFS](https://github.com/LinearTapeFileSystem), [ISO9660](https://en.wikipedia.org/wiki/ISO_9660)
  - [ext2](https://en.wikipedia.org/wiki/Ext2), [ext3](https://en.wikipedia.org/wiki/Ext3), [ext4](https://en.wikipedia.org/wiki/Ext4), [btrfs](https://en.wikipedia.org/wiki/Btrfs)
  - [NFS](https://en.wikipedia.org/wiki/Network_File_System), [CIFS](https://en.wikipedia.org/wiki/Server_Message_Block), [iSCSI](https://en.wikipedia.org/wiki/ISCSI) 
  - other filesystems will be supported via [FUSE](https://en.wikipedia.org/wiki/Filesystem_in_Userspace)
    - including [IPFS](https://en.wikipedia.org/wiki/InterPlanetary_File_System)
    - [SSHFS](https://en.wikipedia.org/wiki/SSHFS)
    - & [NTFS](https://en.wikipedia.org/wiki/NTFS-3G)
  - [LVM](https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)) with [dmraid](https://en.wikipedia.org/wiki/Non-standard_RAID_levels#LINUX-MD-RAID-10), [dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt) & [LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) are ofc supported.
    - Option for fully-encrypted (except bootloader ofc!) as well as just /home or individual /home/user filesystems is possible and easy to setup.
      - This is espechally desireable for SBCs and well as Notebooks, Netbooks and public Terminals.
  - [VeraCrypt](https://veracrypt.fr/en/Downloads.html) may be packaged and distributed as "extra" package.
###    Networking
  - Drivers for modern WiFi & Ethernet Devices
  - VPN Support
    - [OpenVPN](https://en.wikipedia.org/wiki/OpenVPN) 
    - [WireGuard](https://en.wikipedia.org/wiki/WireGuard)
    - [SSH-Tunneling](https://en.wikipedia.org/wiki/Tunneling_protocol#SSH)
  - Obfuscation
    - [Tor](https://en.wikipedia.org/wiki/Tor_(network))
      - Support for OpenVPN-over-Tor = VPN-Endpoint is an [Onion Service](https://en.wikipedia.org/wiki/Tor_(network)#Onion_services)
        - This should only be used to access a private network, not as a means to anonymize internet connections.
        - It may however be used to circumvent restrictions and general assholeism aka. banning Tor users outright.
