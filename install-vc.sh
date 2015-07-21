#!/bin/sh

# script to install msvc
set -e

export WINEPREFIX=$PWD/bottle-vc10
export WINEARCH=win32
export WINEDEBUG=-all

rm -rf $WINEPREFIX

# FIXME: stuff crashes at the very end vc10 install
winetricks --no-isolate -q cmake vc2010express

# FIXME: boost unattended install does not work
wget -c http://downloads.sourceforge.net/boost/boost-binaries/1.58.0/boost_1_58_0-msvc-10.0-32.exe -P /tmp
wine /tmp/boost_1_58_0-msvc-10.0-32.exe /S

wget -c http://downloads.sourceforge.net/openblas/v0.2.14/OpenBLAS-v0.2.14-Win32.zip -P /tmp
bsdtar -xf /tmp/OpenBLAS-v0.2.14-Win32.zip -C $WINEPREFIX/drive_c/local/

wget -c ftp://ftp.zlatkovic.com/libxml/libxml2-2.7.8.win32.zip -P /tmp
bsdtar -xf /tmp/libxml2-2.7.8.win32.zip -C $WINEPREFIX/drive_c/local/

wget -c http://download.qt.io/official_releases/jom/jom.zip -P /tmp
mkdir -p $WINEPREFIX/drive_c/local/jom
bsdtar -xf /tmp/jom.zip -C $WINEPREFIX/drive_c/local/jom

# cp ./vc-* $WINEPREFIX
# tar czf bottle-vc10.tar.gz $WINEPREFIX/*
