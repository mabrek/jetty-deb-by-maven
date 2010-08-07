#!/bin/sh
set -e

VERSION=$2
TAR=jetty_$VERSION.orig.tar.gz
PATCH=jetty_$VERSION.patch
DIR=jetty-$VERSION
TAG=$(echo jetty-$VERSION | sed 's,~alpha,-alpha-,')

# Grab SVN Tag
if [ ! -f $TAR ] ; then
    svn export http://dev.eclipse.org/svnroot/rt/org.eclipse.jetty/jetty/tags/$TAG/ $DIR

   # Create Tarball
   tar -c -z -f $TAR $DIR

   # Cleanup
   rm -rf $DIR
fi

# Cleanup
rm -f ../$TAG


