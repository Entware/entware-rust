# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bcrypt
PKG_VERSION:=4.1.2
PKG_RELEASE:=1

PYPI_NAME:=bcrypt
PKG_HASH:=33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=python-setuptools-rust/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-bcrypt
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Modern password hashing
  URL:=https://github.com/pyca/bcrypt/
  DEPENDS:=+python3-light
endef

define Package/python3-bcrypt/description
  Good password hashing for your software and your servers.
endef

RUSTFLAGS += -C relocation-model=pic

define Package/python3-bcrypt/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,python3-bcrypt))
$(eval $(call BuildPackage,python3-bcrypt))
#$(eval $(call BuildPackage,python3-bcrypt-src))
