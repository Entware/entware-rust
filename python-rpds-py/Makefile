# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rpds-py
PKG_VERSION:=0.24.0
PKG_RELEASE:=1

PYPI_NAME:=rpds_py
PKG_HASH:=772cc1b2cd963e7e17e6cc55fe0371fb9c704d63e44cacec7b9b7f523b78919e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=maturin/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-rpds-py
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Bindings to Rust's persistent data structures
  URL:=https://github.com/crate-py/rpds
  DEPENDS:=+python3-light
endef

define Package/python3-rpds-py/description
Python bindings to the Rust rpds crate for persistent data structures.
endef

RUSTFLAGS += -C relocation-model=pic

define Package/python3-rpds-py/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/rpds
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_SOURCE_NAME)-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,python3-rpds-py))
$(eval $(call BuildPackage,python3-rpds-py))
#$(eval $(call BuildPackage,python3-rpds-py-src))
