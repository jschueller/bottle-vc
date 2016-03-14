#!/bin/sh

# script to install msvc
# pacman -S winetricks wine-mono wine_gecko samba
# on debian, requires winbind to run

set -e

export WINEPREFIX=$PWD/bottle-vc10
export WINEARCH=win32
export WINEDEBUG=-all

rm -rf ${WINEPREFIX}

# NOTE: vc10 install pops up an error, click OK to ignore
# NOTE: requires dotnet40 to avoid linker error
winetricks --no-isolate -q cmake vc2010express dotnet40

wget -c http://download.qt.io/official_releases/jom/jom.zip -P /tmp
mkdir -p ${WINEPREFIX}/drive_c/local/jom
bsdtar -xf /tmp/jom.zip -C ${WINEPREFIX}/drive_c/local/jom

cp ./vc-* ${WINEPREFIX}


wget -c https://github.com/stevengj/nlopt/archive/nlopt-2.4.2.tar.gz -P /tmp
rm -rf /tmp/nlopt-2.4.2
bsdtar -xf /tmp/nlopt-2.4.2.tar.gz -C /tmp
pushd /tmp/nlopt-nlopt-2.4.2
cp /usr/include/nlopt.hpp /usr/include/nlopt.f api # https://github.com/stevengj/nlopt/pull/49
${WINEPREFIX}/vc-cmake -DCMAKE_INSTALL_PREFIX=\"C:\\local\\nlopt-2.4.2\" -DBUILD_SHARED_LIBS=ON .
${WINEPREFIX}/vc-make install -j2
popd


wget -c https://github.com/beltoforion/muparser/archive/v2.2.5.tar.gz -P /tmp
wget -c https://github.com/beltoforion/muparser/pull/13.patch -P /tmp
rm -rf /tmp/muparser-2.2.5
bsdtar -xf /tmp/v2.2.5.tar.gz -C /tmp
pushd /tmp/muparser-2.2.5
patch -p1 -i /tmp/13.patch
rm src/muParserTest.cpp # FIXME: building muParserTest fails
${WINEPREFIX}/vc-cmake -DBUILD_SAMPLES=OFF -DCMAKE_INSTALL_PREFIX=\"C:\\local\\muparser-2.2.5\" .
${WINEPREFIX}/vc-make install -j2
popd


wget -c http://downloads.sourceforge.net/openblas/v0.2.15/OpenBLAS-v0.2.15-Win32.zip -P /tmp
bsdtar -xf /tmp/OpenBLAS-v0.2.15-Win32.zip -C ${WINEPREFIX}/drive_c/local/

wget -c ftp://ftp.zlatkovic.com/pub/libxml/iconv-1.9.2.win32.zip -P /tmp
bsdtar -xf /tmp/iconv-1.9.2.win32.zip -C ${WINEPREFIX}/drive_c/local/

wget -c ftp://ftp.zlatkovic.com/libxml/libxml2-2.7.8.win32.zip -P /tmp
bsdtar -xf /tmp/libxml2-2.7.8.win32.zip -C ${WINEPREFIX}/drive_c/local/


wget -c https://www.threadingbuildingblocks.org/sites/default/files/software_releases/windows/tbb44_20160128oss_win_0.zip -P /tmp
bsdtar -xf /tmp/tbb44_20160128oss_win_0.zip -C ${WINEPREFIX}/drive_c/local/

# FIXME: boost unattended install does not work
wget -c http://downloads.sourceforge.net/boost/boost-binaries/1.60.0/boost_1_60_0-msvc-10.0-32.exe -P /tmp
wine /tmp/boost_1_60_0-msvc-10.0-32.exe /S
# dont need these huge libs for now
rm -r ${WINEPREFIX}/drive_c/local/boost_1_60_0/lib32-msvc-10.0/


# tar czf bottle-vc10.tar.gz bottle-vc10/*

