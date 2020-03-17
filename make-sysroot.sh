#!/bin/bash

mkdir -p /var/cache/sysroots/opensuse-1571654462
mkdir /var/cache/sysroots/opensuse-1571654462/proc
mkdir /var/cache/sysroots/opensuse-1571654462/dev
mkdir /var/cache/sysroots/opensuse-1571654462/dev/pts
mkdir /var/cache/sysroots/opensuse-1571654462/sys
mkdir /var/cache/sysroots/opensuse-1571654462/tmp
mount /proc -o bind /var/cache/sysroots/opensuse-1571654462/proc
mount /dev -o bind /var/cache/sysroots/opensuse-1571654462/dev
mount /dev/pts -o bind /var/cache/sysroots/opensuse-1571654462/dev/pts
mount /sys -o bind /var/cache/sysroots/opensuse-1571654462/sys

zypper --root /var/cache/sysroots/opensuse-1571654462 ar "https://download.opensuse.org/tumbleweed/repo/oss/" repo-oss
zypper --root /var/cache/sysroots/opensuse-1571654462 in -t pattern base 
zypper --root /var/cache/sysroots/opensuse-1571654462 in systemd-sysvinit dhcp dhcp-client ca-certificates vim

mkdir -p /var/cache/sysroots/opensuse-1571654462/etc/sysconfig/network
cp ifcfg-eth0 /var/cache/sysroots/opensuse-1571654462/etc/sysconfig/network/

umount /var/cache/sysroots/opensuse-1571654462/sys
umount /var/cache/sysroots/opensuse-1571654462/dev/pts
umount /var/cache/sysroots/opensuse-1571654462/dev
umount /var/cache/sysroots/opensuse-1571654462/proc

tar -cvzf rootfs.tar.gz -C /var/cache/sysroots/opensuse-1571654462 .
tar -cvzf metadata.tar.gz metadata.yaml

echo "ROOTFS built, do not forget to delete /var/cache/sysroots/opensuse-1571654462"

