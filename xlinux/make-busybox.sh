#!/bin/sh

h=`sort ../busybox.links | uniq`

if [ "$(hostname)" == "X-Linux" ]; then
  prefix="/bin"
else
  prefix="../../bin"
fi  

cp $prefix/busybox ./bin

prefix=$PWD

for i in $h; do
  appdir=`dirname $i`
  mkdir -p $prefix/$appdir || exit 1
    case "$appdir" in
      /)
        bb_path="bin/busybox"
      ;;
      /bin)
        bb_path="busybox"
      ;;
      /sbin)
        bb_path="../bin/busybox"
      ;;
      /usr/bin|/usr/sbin)
        bb_path="../../bin/busybox"
      ;;
      *)
      echo "Unknown installation directory: $appdir"
      exit 1
      ;;
    esac
    if [ ! -e "$prefix$i" ]; then
      ln -fs $bb_path $prefix$i || exit 1
    else
      echo "  $prefix$i already exists"
    fi
done
