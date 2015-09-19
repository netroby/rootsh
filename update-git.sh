#!/bin/sh
VERSION="2.5.3"
if [ ! -z $1 ];then
    VERSION=$1
fi

if [ -d /etc/apt ];then
    distro="ubuntu or debian"
    sudo apt-get update 
    sudo apt-get install -y build-essential wget
    sudo  apt-get build-dep -y git
fi

if [ -d /etc/yum.repos.d ];then
    distro="centos or fedora"
    sudo yum update -y 
    sudo yum groupinstall "Development Tools"
    sudo yum install -y openssl-devel zlib-devel perl-ExtUtils-MakeMaker svn tcl perl-Locale-Msgfmt gettext wget
fi


if [ ! -d ~/software ];then
    mkdir ~/software
fi

cd ~/software
wget -c https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz
tar zxvf git-${VERSION}.tar.gz
cd git-${VERSION}
./configure --prefix=/usr
CPUCORE=$(cat /proc/cpuinfo | grep processor | wc -l)
make -j${CPUCORE} ; sudo make install
git --version
echo "Now git up to date"
