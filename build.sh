umount /dev/sdb1
umount /dev/sdb2
#chmod +xxx lib/*
cd kernel
#./make-kernel.sh
cd ..
cd cups
#./make-cups.sh
cd ..
sudo rm usr/share/cups/ipptool/document*
cp /lib/i386-linux-gnu/libm.so.6 lib/libm.so.6
cd xlinux
sudo bash install-xlinux.sh /dev/sdb
cd ..
