# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-orjson
PKG_VERSION:=3.8.1
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=07c42de52dfef56cdcaf2278f58e837b26f5b5af5f1fd133a68c4af203851fc7

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=./tomli.txt

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rust.mk

PKG_BUILD_DEPENDS:=maturin/host

define Package/python3-orjson
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=a fast, correct JSON library for Python
  URL:=https://github.com/ijl/orjson
endef

define Package/python3-orjson/description
  Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy.
endef

RUSTC_VARS += \
	PYO3_CROSS_LIB_DIR=$(STAGING_DIR)/opt/lib \
	PYO3_CROSS_PYTHON_VERSION=$(PYTHON3_VERSION)

RUSTFLAGS += -C relocation-model=pic
TARGET_CFLAGS += $(FPIC)
TARGET_LDFLAGS += $(FPIC)

define Build/Compile/Maturin
	( cd $(PKG_BUILD_DIR); \
		$(RUSTC_VARS) \
		RUSTFLAGS="$(RUSTFLAGS)" \
		maturin build --release --strip \
			--features=yyjson \
			-i $(HOST_PYTHON3_BIN) \
			--target=$(RUST_TARGET_TRIPLE) \
	)
	# XXX skip
	touch $(PKG_BUILD_DIR)/setup.py
endef

define Build/Compile
	$(call Py3Build/InstallBuildDepends)
	$(call Build/Compile/Maturin)
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)
	unzip $(CARGO_TARGET_DIR)/wheels/$(PYPI_NAME)-$(PKG_VERSION)-*.whl \
		-d $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)
endef

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
#$(eval $(call BuildPackage,python3-orjson-src))
