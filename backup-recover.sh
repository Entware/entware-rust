#!/bin/sh

if [ ! -d ./feeds/rust ]; then
  echo "error: change the directory" && exit 1
fi

PACKAGES_FEED="./feeds/packages"
PATCH_DIR="./feeds/rust/_patches"
PATCH_BUILDROOT="$PATCH_DIR/tools-openssl-add-as-dependency.patch"
#PATCH_PACKAGES="$PATCH_DIR/lang-python-python-cryptography-disable.patch"
STAMP_BUILDROOT="$PATCH_DIR/.buildroot-patched"
STAMP_PACKAGES="$PATCH_DIR/.packages-patched"

PY_BCRYPT="$PACKAGES_FEED/lang/python/bcrypt"
PY_CRYPT="$PACKAGES_FEED/lang/python/python-cryptography"

backup()
{
# openssl
if [ ! -f $STAMP_BUILDROOT ]; then
  patch -p1 -b -d . < $PATCH_BUILDROOT
  touch $STAMP_BUILDROOT
fi
# python-cryptography
if [ ! -f $STAMP_PACKAGES ]; then
#  patch -p1 -b -d $PACKAGES_FEED < $PATCH_PACKAGES
  mv $PY_BCRYPT/Makefile $PY_BCRYPT/Makefile.orig
  mv $PY_CRYPT/Makefile $PY_CRYPT/Makefile.orig
  touch $STAMP_PACKAGES
fi
}

check()
{
# openssl
patch -p1 --dry-run -d . < $PATCH_BUILDROOT
# python-cryptography
#patch -p1 --dry-run -d $PACKAGES_FEED < $PATCH_PACKAGES
}

recovery()
{
# openssl
if [ -f $STAMP_BUILDROOT ]; then
  patch -p1 -R -d . < $PATCH_BUILDROOT
  rm -fr $STAMP_BUILDROOT ./tools/openssl ./tools/Makefile.orig
fi
# python-cryptography 
if [ -f $STAMP_PACKAGES ]; then
#  patch -p1 -R -d $PACKAGES_FEED < $PATCH_PACKAGES
  rm $STAMP_PACKAGES
  mv $PY_BCRYPT/Makefile.orig $PY_BCRYPT/Makefile
  mv $PY_CRYPT/Makefile.orig $PY_CRYPT/Makefile
fi
}

case "$1" in
    backup)
	backup
	[ $? -eq 0 ] && echo "Done"
    ;;
    check)
	check
    ;;
    recovery)
	recovery
	[ $? -eq 0 ] && echo "Done"
    ;;
    *)
	echo "Usage: $0 {backup|check|recovery}"
	exit 1
    ;;
esac

exit 0
