tar -xvf cups-1.7.0-source.tar.bz2
patch -N -p1 < mantohtml.patch
patch -N -p1 < genstrings.patch
cd cups-1.7.0
./configure --host=i386 --disable-gssapi
ROOTDIR="$(dirname "$(dirname "$PWD")")"
export LIBRARY_PATH="$ROOTDIR/lib/:$ROOTDIR/usr/lib/"
make OPTIONS="-D_FORTIFY_SOURCE=0 -march=i386"
sudo make install DSTROOT=$ROOTDIR
cd ..
sudo cp cups-files.conf ../etc/cups/cups-files.conf
sudo cp cupsd.conf ../etc/cups/cupsd.conf

mkdir pkg
cd pkg
ar -x ../brmfc7420lpr-2.0.1-1.i386.deb
sudo tar xvf data.tar.gz -C $ROOTDIR
tar xvf control.tar.gz
sudo cp postinst $ROOTDIR/etc/init.d/mfc7420-postinst
rm *
ar -x ../cupswrapperMFC7420-2.0.1-2.i386.deb
sudo tar xvf data.tar.gz -C $ROOTDIR
tar xvf control.tar.gz
sudo cp postinst $ROOTDIR/etc/init.d/cupsmfc7420-postinst
rm *
cd ..
rmdir pkg
rm -rf cups-1.7.0
