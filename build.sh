#!/bin/sh

LOGFILE=`pwd`/build.log
DIR=`dirname $0`/unpack.sh

cd $DIR

debuild -uc -us 2>&1 | tee $LOGFILE

cd -
