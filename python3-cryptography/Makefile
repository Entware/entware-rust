# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-cryptography
PKG_VERSION:=39.0.1
PKG_RELEASE:=2

PYPI_NAME:=cryptography
PKG_HASH:=d1f6198ee6d9148405e49887803907fe8962a23e6c6f83ea7d98f1c0de375695

PKG_LICENSE:=Apache-2.0 BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE LICENSE.APACHE LICENSE.BSD LICENSE.PSF

PKG_BUILD_DEPENDS:=libffi/host

HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=cffi ./setuptools-rust.txt # cffi>=1.12

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rust.mk

define Package/python3-cryptography
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Cryptographic recipes and primitives (rust)
  URL:=https://github.com/pyca/cryptography
  DEPENDS:= \
	+libopenssl \
	+python3-cffi \
	+python3-distutils \
	+python3-email \
	+python3-urllib
endef

define Package/python3-cryptography/description
  cryptography is a package which provides cryptographic recipes and primitives
  to Python developers. Our goal is for it to be your "cryptographic standard
  library". It supports Python 3.6+ and PyPy3 7.2+.
endef

RUSTFLAGS += -C relocation-model=pic

PYTHON3_PKG_SETUP_VARS += \
	CARGO_HOME="$(CARGO_HOME)" \
	RUSTFLAGS="$(RUSTFLAGS)"

$(eval $(call Py3Package,python3-cryptography))
$(eval $(call BuildPackage,python3-cryptography))
#$(eval $(call BuildPackage,python3-cryptography-src))
