#!/usr/bin/env sh
VER=0.5.1
DIR=~/Downloads
MIRROR=https://github.com/vmware/octant/releases/download/v${VER}

RCHECKSUMS=$MIRROR/checksums.txt
LCHECKSUMS=$DIR/octant-${VER}-checksums.txt

if [ ! -e $LCHECKSUMS ]
then
    wget -q -O $LCHECKSUMS $RCHECKSUMS
fi

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3
    PLATFORM=${OS}-${ARCH}
    FILE=octant_${VER}_${PLATFORM}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `fgrep $FILE $LCHECKSUMS | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl Linux 64bit tar.gz
dl macOS 64bit tar.gz
dl Windows 64bit zip


