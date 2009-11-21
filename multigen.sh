#!/bin/bash
if [ ! -f domains.list ];
then
    echo "No domain list found!"
    exit 1
fi

TFILE="/tmp/$(basename $0).$$.tmp"

grep -v '^#' domains.list | grep -v '^$' > $TFILE
echo '' >> $TFILE

./lib/csr.sh < $TFILE
rm $TFILE
