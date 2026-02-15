# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.11.5
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=82393ab47b4fe44ffd0a7659fa9cfaacc717eb617c93cde83795f14af5c2e9d5

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_DEPENDS:= \
	getrandom-0215 getrandom-0216 getrandom-031 getrandom-034 maturin/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-orjson
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=a fast, correct JSON library for Python
  URL:=https://github.com/ijl/orjson
  DEPENDS:=+python3-light
endef

define Package/python3-orjson/description
  Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy.
endef

RUSTFLAGS += -C relocation-model=pic

define Build/Prepare
	$(call Build/Prepare/Default)
	$(FIND) $(PKG_BUILD_DIR)/include/cargo \
		-type f -name ".cargo-checksum.json" \
		-exec $(SED) 's/\("files":{\)[^}]*/\1/' {} +
endef

define Package/python3-orjson/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME) || true
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info || true
endef

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
#$(eval $(call BuildPackage,python3-orjson-src))
