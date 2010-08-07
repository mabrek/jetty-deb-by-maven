#!/bin/sh

VERSION=$(dpkg-parsechangelog | egrep '^Version:' | cut -f2 -d' ' | sed 's/-[0-9\.]*$$//')
DIR=jetty-$VERSION
LOGFILE=`pwd`/build.log

cd $DIR

debuild -uc -us 2>&1 | tee $LOGFILE

cd -
