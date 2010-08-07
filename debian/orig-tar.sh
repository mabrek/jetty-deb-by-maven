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

# Download Linux Packaging Patch
# TODO: Make sure that the patch generation goes into the release process as well
# wget -O $PATCH http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-project/$VERSION/jetty-project-$VERSION-linux-packaging.patch
# if [ -f debian/patches/linux-packaging.patch ] ; then
#     rm -f debian/patches/linux-packaging.patch
# fi
# cp $PATCH debian/patches/linux-packaging.patch

# Cleanup
rm -f ../$TAG


