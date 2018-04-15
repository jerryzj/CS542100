#!/usr/bin/env bash

sudo qemu-system-x86_64 --enable-kvm -drive format=raw,file=vm0.img,if=virtio -m 4096 -vnc :0 -net tap,ifname=tap0,script=no,downscript=no -net nic,model=virtio,vlan=0,macaddr=ae:ae:00:00:00:50 -monitor telnet:127.0.0.1:5500,server,nowait

