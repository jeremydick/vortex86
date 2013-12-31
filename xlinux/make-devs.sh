#!/bin/sh
#

cd dev

mkdir -m 755 input
mkdir -m 1777 shm
mkdir -m 755 pts
mkdir -m 755 misc
mkdir -m 755 usb

mknod -m 660 input/mice c 13 63
mknod -m 660 input/mouse0 c 13 32
mknod -m 660 misc/psaux c 10 1
mknod -m 660 misc/rtc c 254 0
mknod -m 666 usb/lp0 c 180 0

mknod -m 600 hda b 3 0
mknod -m 600 hda1 b 3 1
mknod -m 600 hda2 b 3 2
mknod -m 600 hda3 b 3 3
mknod -m 600 hda4 b 3 4
mknod -m 600 hda5 b 3 5
mknod -m 600 hda6 b 3 6
mknod -m 600 hda7 b 3 7
mknod -m 600 hda8 b 3 8
mknod -m 600 hda9 b 3 9
mknod -m 600 hda10 b 3 10

mknod -m 600 hdb b 3 64
mknod -m 600 hdb1 b 3 65
mknod -m 600 hdb2 b 3 66
mknod -m 600 hdb3 b 3 67
mknod -m 600 hdb4 b 3 68
mknod -m 600 hdb5 b 3 69
mknod -m 600 hdb6 b 3 70
mknod -m 600 hdb7 b 3 71
mknod -m 600 hdb8 b 3 72
mknod -m 600 hdb9 b 3 73
mknod -m 600 hdb10 b 3 74

mknod -m 600 hdc b 22 0
mknod -m 600 hdc1 b 22 1
mknod -m 600 hdc2 b 22 2
mknod -m 600 hdc3 b 22 3
mknod -m 600 hdc4 b 22 4
mknod -m 600 hdc5 b 22 5
mknod -m 600 hdc6 b 22 6
mknod -m 600 hdc7 b 22 7
mknod -m 600 hdc8 b 22 8
mknod -m 600 hdc9 b 22 9
mknod -m 600 hdc10 b 22 10

mknod -m 600 hdd b 22 64
mknod -m 600 hdd1 b 22 65
mknod -m 600 hdd2 b 22 66
mknod -m 600 hdd3 b 22 67
mknod -m 600 hdd4 b 22 68
mknod -m 600 hdd5 b 22 69
mknod -m 600 hdd6 b 22 70
mknod -m 600 hdd7 b 22 71
mknod -m 600 hdd8 b 22 72
mknod -m 600 hdd9 b 22 73
mknod -m 600 hdd10 b 22 74

mknod -m 640 mem c 1 1
mknod -m 640 kmem c 1 2
mknod -m 666 null c 1 3
mknod -m 640 port c 1 4
mknod -m 666 zero c 1 5

mknod -m 666 full c 1 7
mknod -m 644 random c 1 8
mknod -m 644 urandom c 1 9

mknod -m 660 ram0 b 1 0
mknod -m 660 ram1 b 1 1
mknod -m 660 ram2 b 1 2
mknod -m 660 ram3 b 1 3
mknod -m 660 ram4 b 1 4
mknod -m 660 ram5 b 1 5
mknod -m 660 ram6 b 1 6
mknod -m 660 ram7 b 1 7
mknod -m 660 ram8 b 1 8
mknod -m 660 ram9 b 1 9

mknod -m 620 tty c 5 0
mknod -m 600 console c 5 1
mknod -m 666 ptmx c 5 2
mknod -m 620 tty0 c 4 0
mknod -m 600 tty1 c 4 1
mknod -m 600 tty2 c 4 2

mknod -m 620 tty3 c 4 3
mknod -m 620 tty4 c 4 4 
mknod -m 620 tty5 c 4 5 
mknod -m 620 tty6 c 4 6 
mknod -m 620 tty7 c 4 7 
mknod -m 620 tty8 c 4 8 
mknod -m 620 tty9 c 4 9 

mknod -m 600 ttyS0 c 4 64

mknod -m 660 ttyS1 c 4 65
mknod -m 660 ttyS2 c 4 66
mknod -m 660 ttyS3 c 4 67

mknod -m 660 loop0 b 7 0
mknod -m 660 loop1 b 7 1
mknod -m 660 loop2 b 7 2
mknod -m 660 loop3 b 7 3
mknod -m 660 loop4 b 7 4
mknod -m 660 loop5 b 7 5
mknod -m 660 loop6 b 7 6
mknod -m 660 loop7 b 7 7

mknod -m 620 vcs0 b 7 0
mknod -m 620 vcs1 b 7 1
mknod -m 620 vcs2 b 7 2
mknod -m 620 vcs3 b 7 3
mknod -m 620 vcs4 b 7 4
mknod -m 620 vcs5 b 7 5
mknod -m 620 vcs6 b 7 6 
mknod -m 620 vcs7 b 7 7
mknod -m 620 vcs8 b 7 8
mknod -m 620 vcs9 b 7 9 

mknod -m 620 vcsa0 b 7 0
mknod -m 620 vcsa1 b 7 1
mknod -m 620 vcsa2 b 7 2
mknod -m 620 vcsa3 b 7 3
mknod -m 620 vcsa4 b 7 4
mknod -m 620 vcsa5 b 7 5
mknod -m 620 vcsa6 b 7 6 
mknod -m 620 vcsa7 b 7 7
mknod -m 620 vcsa8 b 7 8
mknod -m 620 vcsa9 b 7 9 

mknod -m 660 sda b 8 0
mknod -m 660 sda1 b 8 1
mknod -m 660 sda2 b 8 2
mknod -m 660 sdb b 8 16
mknod -m 660 sdb1 b 8 17
mknod -m 660 sdb2 b 8 18

mknod -m 660 dsp c 14 3
mknod -m 620 fb0 c 29 0
mknod -m 620 fb1 c 29 32

mknod -m 600 initctl p 

mknod -m 660 mixer c 14 0
mknod -m 660 nftla b 93 0
mknod -m 660 nftla1 b 93 1
mknod -m 660 nftla2 b 93 2
#mknod -m 600 ppp c 108 0

ln -s /proc/kcore core
ln -s ttyS0 modem
ln -s input/mice mouse
ln -s misc/psaux psaux
ln -s ram1 ram
ln -s vcs0 vcs
ln -s vcsa0 vcsa
