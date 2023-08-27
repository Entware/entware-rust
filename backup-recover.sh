#!/bin/sh

if [ ! -d ./feeds/rust ]; then
  echo "error: change the directory" && exit 1
fi

PACKAGES_FEED="./feeds/packages"
PATCH_DIR="./feeds/rust/_patches"
PATCH_BUILDROOT="$PATCH_DIR/tools-openssl-add-as-dependency.patch"
STAMP_BUILDROOT="$PATCH_DIR/.buildroot-patched"
STAMP_PACKAGES="$PATCH_DIR/.packages-patched"

OWRT_MATURIN="$PACKAGES_FEED/lang/maturin"
OWRT_RIPGREP="$PACKAGES_FEED/utils/ripgrep"
PY_BCRYPT="$PACKAGES_FEED/lang/python/python-bcrypt"
PY_CRYPT="$PACKAGES_FEED/lang/python/python-cryptography"

backup()
{
# tools/{Makefile,cmake,openssl}
if [ ! -f $STAMP_BUILDROOT ]; then
  patch -p1 -b -d . < $PATCH_BUILDROOT
  touch $STAMP_BUILDROOT
fi
# bcrypt maturin python-cryptography ripgrep
if [ ! -f $STAMP_PACKAGES ]; then
  mv $OWRT_MATURIN/Makefile $OWRT_MATURIN/Makefile.orig
  mv $OWRT_RIPGREP/Makefile $OWRT_RIPGREP/Makefile.orig
  mv $PY_BCRYPT/Makefile $PY_BCRYPT/Makefile.orig
  mv $PY_CRYPT/Makefile $PY_CRYPT/Makefile.orig
  touch $STAMP_PACKAGES
fi
}

check()
{
# tools/{Makefile,cmake,openssl}
patch -p1 --dry-run -d . < $PATCH_BUILDROOT
}

recovery()
{
# tools/{Makefile,cmake,openssl}
if [ -f $STAMP_BUILDROOT ]; then
  patch -p1 -R -d . < $PATCH_BUILDROOT
  rm -fr $STAMP_BUILDROOT ./tools/openssl ./tools/Makefile.orig
  rm -f ./tools/cmake/patches/500-curl-fix-libdl-linking.patch.orig
fi
# bcrypt maturin python-cryptography ripgrep
if [ -f $STAMP_PACKAGES ]; then
  rm $STAMP_PACKAGES
  mv $OWRT_MATURIN/Makefile.orig $OWRT_MATURIN/Makefile
  mv $OWRT_RIPGREP/Makefile.orig $OWRT_RIPGREP/Makefile
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
