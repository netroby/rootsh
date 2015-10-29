#!/bin/sh
if [ -z $1 ]; then
    VER=7.1
else
    VER=$1
fi
CPUCORE=$(cat /proc/cpuinfo | grep processor | wc -l)
TARFILE=http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${VER}p1.tar.gz
LOCALFILE=openssh-${VER}p1.tar.gz
LDIR=openssh-${VER}p1
if [ ! -f $LOCALFILE ]; then
    echo "Can not find ssh tar file in local"
    wget -c $TARFILE
fi
if [ ! -d $LDIR ]; then
    echo "Untar files"
    tar zxvf $LOCALFILE
fi
cd $LDIR

if [ -d /etc/apt ]; then
    echo "System was Debunt/Ubuntu"
    sudo apt-get build-dep -y openssh
else
    echo "System was centos/RHEL/fedora"
    sudo yum install -y zlib zlib-devel pam pam-devel openssl openssl-devel gcc patch
fi
chmod a+x configure
./configure --prefix=/usr --sysconfdir=/etc/ssh --enable-pam
make -j${CPUCORE}; sudo make install
cd ..

