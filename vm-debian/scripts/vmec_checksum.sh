#!/bin/bash
# Compare md5 sum of vmec with value downloaded from website

VMEC_ZIP=$1
CHECKSUM_FILE=$2
MD5SUM_BINARY=/usr/bin/md5sum

REGEX_LINUX_MD5SUM='^\([0-9a-f]*\)[ ]*stellinstall.zip$'
REGEX_MACOSX_MD5SUM='^MD5 (stellinstall.zip) = \([0-9a-f]*\)$'

md5sum_stellinstall_local=$($MD5SUM_BINARY $VMEC_ZIP | sed "s/$REGEX_LINUX_MD5SUM/\1/")
echo "md5sum_stellinstall_local: $md5sum_stellinstall_local"

md5sum_stellinstall_server=$(cat md5sum.txt | sed "s/$REGEX_MACOSX_MD5SUM/\1/")
echo "md5sum_stellinstall_server: $md5sum_stellinstall_server"

if [[ $md5sum_stellinstall_local == $md5sum_stellinstall_server ]]; then
    echo "MD5 sums were a match"
    echo $md5sum_vmec_zip
    echo $md5sum_stellinstall_server
    return 1
else
    echo "MD5 sums were NOT a match"
    echo $md5sum_vmec_zip
    echo $md5sum_stellinstall_server
    return 0
fi



