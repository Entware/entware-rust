# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=orjson
PKG_VERSION:=3.9.7
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=85e39198f78e2f7e054d296395f6c96f5e02892337746ef5b6a1bf3ed5910142

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rust.mk

PKG_BUILD_DEPENDS += maturin/host

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
