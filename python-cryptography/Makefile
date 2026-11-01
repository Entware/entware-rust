# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cryptography
PKG_VERSION:=46.0.7
PKG_RELEASE:=1

PYPI_NAME:=cryptography
PKG_HASH:=e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5

PKG_LICENSE:=Apache-2.0 BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE LICENSE.APACHE LICENSE.BSD LICENSE.PSF
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_DEPENDS:= \
	libffi/host \
	maturin/host \
	python-cffi/host \
	python-setuptools/host \
	python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-cryptography
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Cryptographic recipes and primitives (rust)
  URL:=https://github.com/pyca/cryptography
  DEPENDS:= \
	+libopenssl \
	+libopenssl-legacy \
	+python3-cffi \
	+python3-urllib \
	+python3-uuid
endef

define Package/python3-cryptography/description
  cryptography is a package which provides cryptographic recipes and primitives
  to Python developers. Our goal is for it to be your "cryptographic standard
  library".
endef

define Py3Package/python3-cryptography/filespec
+|$(PYTHON3_PKG_DIR)
-|$(PYTHON3_PKG_DIR)/docs
-|$(PYTHON3_PKG_DIR)/tests
-|$(PYTHON3_PKG_DIR)/CHANGELOG.rst
-|$(PYTHON3_PKG_DIR)/CONTRIBUTING.rst
endef

PKG_RUSTFLAGS += -C relocation-model=pic

$(eval $(call Py3Package,python3-cryptography))
$(eval $(call BuildPackage,python3-cryptography))
#$(eval $(call BuildPackage,python3-cryptography-src))
