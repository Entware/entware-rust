# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.13.0
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=d1de5eb04485110c5da4c657e49168995d55e076b1ce60f1a042e254f4186c4f

PKG_LICENSE:=Apache-2.0 MIT MPL-2.0
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT LICENSE-MPL-2.0
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_DEPENDS:= \
	getrandom-0217 getrandom-043 maturin/host

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

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
#$(eval $(call BuildPackage,python3-orjson-src))
