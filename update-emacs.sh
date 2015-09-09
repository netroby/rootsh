#!/bin/sh
if [ -z $1 ]; then
    VER=24.5
else
    VER=$1
fi
CPUCORE=$(cat /proc/cpuinfo | grep processor | wc -l)
TARFILE=https://ftp.gnu.org/gnu/emacs/emacs-${VER}.tar.gz
LOCALFILE=emacs-${VER}.tar.gz
LDIR=emacs-${VER}
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
    sudo apt-get build-dep -y emacs
    sudo apt-get -y install  libncurses-dev
else
    echo "System was centos/RHEL/fedora"
    sudo yum install -y giflib-devel libjpeg-devel libtiff-devel gcc-c++ make ncurses-devel
fi
./configure --prefix=/usr --without-all --with-x-toolkit=no
make -j${CPUCORE}; sudo make install
cd ..

