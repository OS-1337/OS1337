# Assorted utility scripts.

import os
from pathlib import Path
import stat
import subprocess

import modules.config as config

def make_base_dirs():
    Path.mkdir(config.build_dir/'downloads', parents=False, exist_ok=True)
    Path.mkdir(config.build_dir/'working',  parents=False, exist_ok=True)
    Path.mkdir(config.profile_dir,  parents=False, exist_ok=True)
    Path.mkdir(config.rootfs_dir,  parents=False, exist_ok=True)

def make_minimal_filesystem():
    for dir in ['dev','etc/init.d','proc','sys','tmp','bin']:
        Path.mkdir(config.rootfs_dir/dir,  parents=True, exist_ok=True)

    subprocess.call(['/usr/bin/sudo', '/usr/bin/mknod', config.rootfs_dir/'dev'/'console', 'c', '5', '1'])
    subprocess.call(['/usr/bin/sudo', '/usr/bin/mknod', config.rootfs_dir/'dev'/'null', 'c', '1', '3'])

def make_fhs_filesystem():
    for dir in ['bin', 'boot', 'dev','etc', 'home', 'proc', 'root', 'run', 'sbin', 'srv', 'sys','tmp','usr', 'var']:
        Path.mkdir(config.rootfs_dir/dir,  parents=True, exist_ok=True)

    for dir in ['init.d', 'opt', 'sgml', 'xml']:
        Path.mkdir(config.rootfs_dir/'etc'/dir,  parents=True, exist_ok=True)

    for dir in ['local', 'share', 'src']:
        Path.mkdir(config.rootfs_dir/'usr'/dir,  parents=True, exist_ok=True)

    for dir in ['cache','lib','lock','log','mail','opt','run','spool/mail','tmp']:
        Path.mkdir(config.rootfs_dir/'var'/dir,  parents=True, exist_ok=True)
    
    os.symlink(config.rootfs_dir/'bin', config.rootfs_dir/'usr'/'bin')
    os.symlink(config.rootfs_dir/'sbin', config.rootfs_dir/'usr'/'sbin')
    os.symlink(config.rootfs_dir/'lib', config.rootfs_dir/'usr'/'lib')
    os.symlink(config.rootfs_dir/'lib', config.rootfs_dir/'lib32')
