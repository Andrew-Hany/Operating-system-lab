- in this lab we are targeting to add our version of fork(pfork) 
which will have 2 childer not one as fork

-in order to comile the kernel, you will need to do the following 
a)do the following:
    1)sudo apt-get update
    2)sudo apt-get upgrade
    3)sudo apt-get install libncurses-dev flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
    4)sudo apt-get install build-essential libncurses-dev bison flex libssl-dev libelf-dev
    5)sudo apt-get install bc
b)make oldconfig
c)make menuconfig 
    1)go through crypto api 
    2)then go to the last choice and press enter
    3)then go to the third choice and press enter and delete what is inside
    4)save and add your kernel name after .config and then exit
    5)then save again with .config
d)make -j 4 (to compile the kernel using 4 cores)
e)make modules
f)sudo make INSTALL_MOD_STRIP=1 modules_install
g)sudo make INSTALL_MOD_STRIP=1 install
h)reboot and choose advanced and the new version of kernel

- Files i modified code
1)linux/include/linux/syscalls.h
2)linux/include/linux/sched.h
3)linux/arch/x86/entry/syscalls/sys_call_64.tbl
4)linux/kernel/fork.c
5)linux/kernel/exit.c

-
