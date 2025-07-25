#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/derailed/k9s/releases/download
APP=k9s

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="${APP}_${platform}.${archive_type}"
    local url=$MIRROR/$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep -e "$file\$" $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local checksums="checksums.sha256"
    # https://github.com/derailed/k9s/releases/download/v0.28.0/checksums.sha256
    local url=$MIRROR/$ver/$checksums
    local lchecksums="$DIR/${APP}-${ver}-${checksums}"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  %s:\n" $ver

    dl $ver $lchecksums Darwin arm64
    dl $ver $lchecksums Darwin amd64
    dl $ver $lchecksums Freebsd armv7
    dl $ver $lchecksums Freebsd arm64
    dl $ver $lchecksums Linux armv7
    dl $ver $lchecksums Linux arm64
    dl $ver $lchecksums Linux ppc64le
    dl $ver $lchecksums Linux s390x
    dl $ver $lchecksums Linux amd64
    dl $ver $lchecksums Windows arm64 zip
    dl $ver $lchecksums Windows amd64 zip
}

dl_ver ${1:-v0.50.9}
