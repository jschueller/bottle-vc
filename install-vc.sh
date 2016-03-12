#!/bin/sh

# script to install msvc
# pacman -S winetricks wine-mono wine_gecko samba
# on debian, requires winbind to run

set -e

export WINEPREFIX=$PWD/bottle-vc10
export WINEARCH=win32
export WINEDEBUG=-all

rm -rf ${WINEPREFIX}

# NOTE: stuff crashes at the very end of vc10 install
# NOTE: requires dotnet40 to avoid linker error
winetricks --no-isolate -q cmake vc2010express dotnet40

# FIXME: boost unattended install does not work
wget -c http://downloads.sourceforge.net/boost/boost-binaries/1.60.0/boost_1_60_0-msvc-10.0-32.exe -P /tmp
wine /tmp/boost_1_60_0-msvc-10.0-32.exe /S
# dont need these huge libs for now
rm -r ${WINEPREFIX}/drive_c/local/boost_1_60_0/lib32-msvc-10.0/

wget -c http://downloads.sourceforge.net/openblas/v0.2.15/OpenBLAS-v0.2.15-Win32.zip -P /tmp
bsdtar -xf /tmp/OpenBLAS-v0.2.15-Win32.zip -C ${WINEPREFIX}/drive_c/local/

wget -c ftp://ftp.zlatkovic.com/libxml/libxml2-2.7.8.win32.zip -P /tmp
bsdtar -xf /tmp/libxml2-2.7.8.win32.zip -C ${WINEPREFIX}/drive_c/local/

wget -c http://download.qt.io/official_releases/jom/jom.zip -P /tmp
mkdir -p ${WINEPREFIX}/drive_c/local/jom
bsdtar -xf /tmp/jom.zip -C ${WINEPREFIX}/drive_c/local/jom

wget -c https://www.threadingbuildingblocks.org/sites/default/files/software_releases/windows/tbb44_20160128oss_win_0.zip -P /tmp
bsdtar -xf /tmp/tbb44_20160128oss_win_0.zip -C ${WINEPREFIX}/drive_c/local/

cp ./vc-* ${WINEPREFIX}

# tar czf bottle-vc10.tar.gz bottle-vc10/*

