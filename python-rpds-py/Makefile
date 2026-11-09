# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rpds-py
PKG_VERSION:=2026.9.1
PKG_RELEASE:=1

PYPI_NAME:=rpds_py
PKG_HASH:=4793ef7f78268b124b73fa933440f01d258bbae01de9fa53e9080c9ab0425a12

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

PKG_RUSTFLAGS += -C relocation-model=pic

$(eval $(call Py3Package,python3-rpds-py))
$(eval $(call BuildPackage,python3-rpds-py))
#$(eval $(call BuildPackage,python3-rpds-py-src))
