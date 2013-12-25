umount /dev/sdb1
umount /dev/sdb2
cd cups
#./make-cups.sh
cd ..
cd xlinux
./xlinux-install.sh /dev/sdb
cd ..
