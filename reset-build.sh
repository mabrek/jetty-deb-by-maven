#!/bin/bash

PACKAGE=$(dpkg-parsechangelog | egrep '^Source:' | cut -f2 -d' ')
VERSION=$(dpkg-parsechangelog | egrep '^Version:' | cut -f2 -d' ' | sed 's/-[0-9\.]*$$//')

PWD=`pwd`

for FOO in *jetty*$VERSION*
do
    if [ $FOO == jetty_$VERSION.orig.tar.gz ]
    then
       echo "Leaving $FOO"
    elif [ $FOO == jetty_$VERSION.patch ]
    then
       echo "Leaving $FOO"
    else
        if [ -d $FOO ] ; then
            if [ -n $FOO ] ; then
                echo "Removing DIR: $FOO"
                rm -rf $PWD/$FOO
            fi
        else
            echo "Removing $FOO"
            rm $FOO
        fi
    fi
done

