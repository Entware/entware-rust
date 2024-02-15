# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.9.13
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=fc6bc65b0cf524ee042e0bc2912b9206ef242edfba7426cf95763e4af01f527a

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT
PKG_MAINTAINER:=Entware team, https://entware.net

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rustc-dev/rust.mk

PKG_BUILD_DEPENDS += maturin/host chrono-0431

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

PYTHON3_PKG_SETUP_VARS += \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)" \
	CARGO_HOME="$(CARGO_HOME)" \
	RUSTFLAGS="$(RUSTFLAGS)" \
	PYO3_CROSS_LIB_DIR=$(STAGING_DIR)/opt/lib \
	PYO3_CROSS_PYTHON_VERSION=$(PYTHON3_VERSION)

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
#$(eval $(call BuildPackage,python3-orjson-src))
