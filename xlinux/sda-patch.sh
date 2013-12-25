#!/bin/sh
mount /dev/sda1 /mnt
echo "DEFAULT linux" > /mnt/syslinux.cfg
echo "LABEL linux" >> /mnt/syslinux.cfg
echo "KERNEL bzimage" >> /mnt/syslinux.cfg
echo "APPEND root=/dev/hda2" >> /mnt/syslinux.cfg
umount /mnt
mount /dev/sda2 /mnt
cp -f /mnt/etc/fstab.hda /mnt/etc/fstab
umount /mnt
