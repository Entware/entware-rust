# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=uv
PKG_VERSION:=0.5.4
PKG_RELEASE:=1

PYPI_NAME:=uv
PKG_HASH:=cd7a5a3a36f975a7678f27849a2d49bafe7272143d938e9b6f3bf28392a3ba00

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_BUILD_DEPENDS:=boxcar-027 maturin/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-uv
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=An extremely fast Python package and project manager
  URL:=https://pypi.org/project/uv/
  DEPENDS:= \
	+python3-asyncio \
	+python3-ctypes \
	+python3-logging \
	+python3-setuptools \
	+python3-urllib
endef

RUSTFLAGS += -C relocation-model=pic

define Package/python3-uv/description
  An extremely fast Python package and project manager, written in Rust.
endef

define Package/python3-uv/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,python3-uv))
$(eval $(call BuildPackage,python3-uv))
#$(eval $(call BuildPackage,python3-uv-src))
