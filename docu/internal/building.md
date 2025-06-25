#   OS/1337
### Building Guide

With this guide, you should be able to rebuild OS/1337.

---

##	1.	Setup your Development / Build Envoirment
- See [Package Build Guide - Prerequesites](docu/building-packages.md#Prerequesites) for details.

Generally speaking, you can build it with anything that can build linux and toybox, which at least means a C compiler and means to manipulate files or if necessary make a .config file to build from.

As of now, we're sadly stuck on GCC, but will gladly switch to LLVM/Clang if that's a possibility with Linux.

##	2.	Getting the code ready to build.

Since we want to build a ```musl + toybox / linux system```, we'll need the requisite packages and sources ready.

- As OS/1337 is statically compiled against musl, more specifically the same ```musl-cross``` package used to make the reference binaries of toybox, one should've these ready and extracted into a ```./musl-cross-``` directory below the sourcecode root folder of each to-be-compiled software. [i.e. ```./linux-6.6.6/musl.cross-i486``` if you want to build ```linux-6.6.6``` for ```i486```].

- Unless you want to modify OS/1337 beyond the basic configs maintained, like "The ```CORE``` Editon", you may want to acquire the .config files from this project as well, since these are the reference material.

##	3.	Make shure you have everything in place.

If you use an official config and have all the necessary parts in place then you should be able to just let it automatically build OS/1337 from source on your machine.

- Please make shure to have adequate system resources in terms of CPU, RAM, Storage at hand since building it will likely require a lot of it.

