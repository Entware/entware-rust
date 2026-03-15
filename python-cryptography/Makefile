# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cryptography
PKG_VERSION:=46.0.5
PKG_RELEASE:=1

PYPI_NAME:=cryptography
PKG_HASH:=abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d

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
	+python3-email \
	+python3-urllib \
	+python3-uuid
endef

define Package/python3-cryptography/description
  cryptography is a package which provides cryptographic recipes and primitives
  to Python developers. Our goal is for it to be your "cryptographic standard
  library".
endef

CARGO_PKG_CONFIG_VARS += \
	PYO3_CROSS_INCLUDE_DIR=$(PYTHON3_INC_DIR)

RUSTFLAGS += -C relocation-model=pic

define Package/python3-cryptography/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME) || true
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info || true
endef

$(eval $(call Py3Package,python3-cryptography))
$(eval $(call BuildPackage,python3-cryptography))
#$(eval $(call BuildPackage,python3-cryptography-src))
