#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/vmware/octant/releases/download

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file=octant_${ver}_${platform}.${archive_type}
    local url=$MIRROR/v$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $lchecksums | awk '{print $1}'`
}

dl_ver() {
    local ver=$1

    local rchecksums=$MIRROR/v${ver}/checksums.txt
    local lchecksums=$DIR/octant-${ver}-checksums.txt

    if [ ! -e $lchecksums ];
    then
        wget -q -O $lchecksums $rchecksums
    fi

    printf "  '%s':\n" $ver
    dl $ver $lchecksums Linux 64bit
    dl $ver $lchecksums Linux arm
    dl $ver $lchecksums Linux arm64
    dl $ver $lchecksums macOS 64bit
    dl $ver $lchecksums Windows 64bit zip
}

dl_ver ${1:-0.10.0}
