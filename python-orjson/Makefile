# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.11.7
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=9b1a67243945819ce55d24a30b59d6a168e86220452d2c96f4d1f093e71c0c49

PKG_LICENSE:=Apache-2.0 MIT MPL-2.0
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT LICENSE-MPL-2.0
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_DEPENDS:= \
	getrandom-0215 getrandom-0216 getrandom-0217 getrandom-031 \
	getrandom-034 maturin/host

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

PKG_RUSTFLAGS += -C relocation-model=pic

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
