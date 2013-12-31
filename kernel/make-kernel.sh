tar -xvf linux-2.6.29.6.tar.bz2
patch -N -p1 < gcc_32_bit_flag.patch
cp kernel-2.6.29.6-vortex86sx.config linux-2.6.29.6/.config
cd linux-2.6.29.6
ROOTDIR="$(dirname "$(dirname "$PWD")")"
export LIBRARY_PATH="$ROOTDIR/lib/:$ROOTDIR/usr/lib/"
make
cd ..
mkdir ../lib/modules
mkdir ../lib/modules/2.6.29.6
cp linux-2.6.29.6/drivers/usb/class/usblp.ko ../lib/modules/2.6.29.6/
rm -rf linux-2.6.29.6
