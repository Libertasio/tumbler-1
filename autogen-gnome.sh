#!/bin/sh
# Run this to generate all the initial makefiles, etc.

export ACLOCAL_FLAGS="-I `pwd`/m4 $ACLOCAL_FLAGS"

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="tumbler"
REQUIRED_AUTOMAKE_VERSION=1.9

(test -f $srcdir/configure.ac \
  && test -f $srcdir/README) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

# Automake requires that ChangeLog exist.
touch ChangeLog

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}
. gnome-autogen.sh
