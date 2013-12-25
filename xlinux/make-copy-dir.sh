#!/bin/sh

if [ "$(hostname)" == "X-Linux" ]; then
  prefix=""
else
  prefix="../../"
fi  

cp -a $prefix/etc  ./
chmod -R 644 ./etc/*
chmod -R 744 ./etc/init.d/
chmod 744 ./etc/profile

if [ "$1" == "/dev/sda" ] || [ "$1" == "/dev/sdb" ]; then
  cp ./etc/fstab.sda ./etc/fstab
else
  cp ./etc/fstab.hda ./etc/fstab
fi


if [ "$1" != "imgbb" ]; then

  cp -a $prefix/bin ./
  chmod -R 755 ./bin/*

  cp -a $prefix/lib ./
  chmod -R 755 ./lib/*
  chmod 777 ./lib/*
  
  rm -f ./sbin/mkdosfs
  rm -f ./sbin/mke2fs
  cp -a $prefix/sbin ./
  chmod -R 755 ./sbin/*

  cp -a $prefix/usr ./
  chmod -R 755 ./usr/*
  chmod 777 ./usr/lib/*

  mkdir xlinux
  cp $prefix/xlinux/*.sh ./xlinux
  cp $prefix/xlinux/busybox.links ./xlinux
  cp $prefix/xlinux/bzImage* ./xlinux
  cp $prefix/xlinux/fdisk.in ./xlinux
  cp $prefix/xlinux/syslinux.* ./xlinux
  chmod -R 755 ./xlinux/*

fi

cp -a $prefix/www  ./
chmod -R 755 ./www/*

chmod 755 *
chmod 777 tmp

