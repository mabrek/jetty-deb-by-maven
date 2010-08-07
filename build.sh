#!/bin/sh

PACKAGE=$(dpkg-parsechangelog | egrep '^Source:' | cut -f2 -d' ')
VERSION=$(dpkg-parsechangelog | egrep '^Version:' | cut -f2 -d' ' | sed 's/-[0-9\.]*$$//')

TAR=jetty_$VERSION.orig.tar.gz
DIR=jetty-$VERSION

if [ ! -d $DIR ] ; then
    if [ ! -f $TAR ] ; then
        echo "WARNING: tarball not found: $TAR "
        exit 1
    fi

    tar -zxf $TAR
fi

if [ ! -d $DIR ] ; then
    echo "WARNING: missing expected dir: $DIR"
    exit 1
fi

LOGFILE=`pwd`/build.log
cd $DIR

if [ ! -d debian ] ; then
    rsync -azPS --exclude="*.swp" ../debian .
fi

debuild -uc -us 2>&1 | tee $LOGFILE

cd -

