# Homework 1 guide

The instruction from TA sucks, let me give you some helpful tips while setting up the virtual network adapter.

1. Set-up your VM
    
You must choose **English**! If you choose Traditional Chinese, some error (“無法安裝 busybox-initramfs” ) will happen during installation process. After rebooting, you will stuck on **booting from hard disk** screen.

To solve this problem, just remove the virtual disk file and restart your VM.

2. In your terminal, type **ifconfig**

then the terminal will show some information like this

![ifconfig](https://github.com/jerryzj/CS542100/blob/master/img/ifconfig.png)

In the above picture, you may noticed that I have **docker0**, **vmnet1** in my computer, that's because I've installed docker and VMware in my system. Just remember your network adapter name. In my case, my network adapter name is **enp0s31f6**

The keypoint to setup a bridged network with TAP interfaces is to create a new network interface first. Otherwise, when you open **/etc/network/interfaces** file, you will see this

    # interfaces(5) file used by ifup(8) and ifdown(8)
    auto lo
    iface lo inet loopback
    
Which makes me confused for a long time.

So, just forget what TA said before, and use follow instructoin

    > sudo brctl addbr br0  // Add a new network interface
    > brctl show
    bridge name     bridge id               STP enabled     interfaces
    br0             8000.000000000000       no
    >brctl addif br0 (Your hardware network adapter name)
