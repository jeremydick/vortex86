#!/bin/sh

IMAGE_PATH=xlinux_mnt
RAM_DISK_FILE=ramdisk
DEV_NODE=0

if [ "$1" == "/dev/hda" ] || [ "$1" == "/dev/hdb" ] || [ "$1" == "/dev/hdc" ] || [ "$1" == "/dev/hdd" ] || [ "$1" == "/dev/sda" ] || [ "$1" == "/dev/sdb" ]; then
  DEV_NODE=1
fi

# Check parameter and path

if [ "$1" != "img" ] && [ "$1" != "imgbb" ] && [ "$DEV_NODE" == "0" ]; then
  echo
  echo "Usage: $0 DEVICE"
  echo
  echo "       DEVICE=/dev/hd[a-d] -> install X-Linux on to hard disk"
  echo "       DEVICE=/dev/sd[a-b] -> install X-Linux on to USB mass storage"
  echo "       DEVICE=img          -> make X-Linux RAM disk image"
  echo "       DEVICE=imgbb        -> make X-Linux RAM disk image with BusyBox only"
  echo
  echo "  Ex: $0 /dev/hdc"
  echo "      $0 /dev/sda"
  echo "      $0 img"
  echo "      $0 imgbb"
  echo
  exit 0
fi

mount -o remount,rw /

if [ "$IMAGE_PATH" == "" -o ! -d "$IMAGE_PATH" ]; then
  mkdir $IMAGE_PATH
fi

# Prepare HDD or RAM disk image

echo

if [ "$DEV_NODE" == "1" ]; then

  echo Install X-Linux onto $1
  echo
  
  echo Make partitions
  umount /boot > /dev/null 2>&1
  fdisk $1 < ./fdisk.in > /dev/null
  
  echo Fromat "$1"1
  
  if [ "$(hostname)" == "X-Linux" ]; then
    mkdosfs "$1"1 > /dev/null 2>&1
    syslinux "$1"1
  else
    ../sbin/mkdosfs "$1"1 > /dev/null 2>&1
    ../sbin/syslinux "$1"1
  fi
  
  echo Install boot loader
  mount "$1"1 $IMAGE_PATH
  echo "DEFAULT linux" > $IMAGE_PATH/syslinux.cfg
  echo "LABEL linux" >> $IMAGE_PATH/syslinux.cfg
  echo "KERNEL bzimage" >> $IMAGE_PATH/syslinux.cfg

  if [ "$1" == "/dev/sda" ] || [ "$1" == "/dev/sdb" ]; then
    echo "APPEND root=$1"2 rootdelay=10 >> $IMAGE_PATH/syslinux.cfg
  else
    echo "APPEND root=$1"2 >> $IMAGE_PATH/syslinux.cfg
  fi

  cp ./bzImage $IMAGE_PATH/bzImage
  umount $IMAGE_PATH

  echo Format "$1"2
  mke2fs "$1"2 > /dev/null 2>&1
  echo Mount "$1"2
  mount "$1"2 $IMAGE_PATH  
   
elif [ "$1" == "img" ] || [ "$1" == "imgbb" ]; then

  echo Install X-Linux onto RAM disk image
  
  if [ "$(hostname)" == "X-Linux" ]; then
    prefix="/tmp"
  else
    prefix="."
  fi    
  
  echo Create RAM disk image
  mount -o remount,rw /
  dd if=/dev/zero of=$prefix/$RAM_DISK_FILE bs=1024 count=16384
  losetup /dev/loop0 $prefix/$RAM_DISK_FILE
  mke2fs -m 0 -b 1024 /dev/loop0 16384 > /dev/null 2>&1

  echo Mount RAM disk image
  mount -t ext2 /dev/loop0 $IMAGE_PATH
  
fi

# Make directories, links and copy files

cd $IMAGE_PATH

echo Make basic directories
mkdir boot bin dev etc home lib mnt proc root sbin sys tmp usr var ./usr/bin ./usr/sbin ./var/run ./var/lib ./var/lock ./var/log
chmod -R 755 *

echo Install BusyBox
../make-busybox.sh

echo Make device nodes
../make-devs.sh

echo Copy directories
../make-copy-dir.sh $1

echo Sync
sync

cd ..


# Patch for USB mass storage
if [ "$1" == "/dev/sda" ] || [ "$1" == "/dev/sdb" ]; then
  cd $IMAGE_PATH
  cd etc
  cp -f ./fstab.sda ./fstab
  cd ..
  cd ..
  fi

# Umount device

if [ "$DEV_NODE" == "1" ]; then

  echo Umount "$1"2
  umount "$1"2
  
elif [ "$1" == "img" ] || [ "$1" == "imgbb" ]; then

  echo Umount RAM disk image
  umount $IMAGE_PATH
  losetup -d /dev/loop0
  gzip -9f $prefix/$RAM_DISK_FILE
  echo X-Linux RAM disk image path = $prefix/$RAM_DISK_FILE.gz
  
fi

cd $IMAGE_PATH
rm -rf *
cd ..
rmdir $IMAGE_PATH

echo Done!
echo

