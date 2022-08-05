# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-orjson
PKG_VERSION:=3.7.5
PKG_RELEASE:=1

PYPI_NAME:=orjson
PKG_HASH:=47c9d2b3f993b630b1efa58ad128b5d8a61cd7cd5c0cec8dad043a1ab9d02866

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/package/rust/rust.mk

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

RUSTFLAGS += -C relocation-model=pic
CARGO_ARGS += -Z unstable-options
RUSTC_VARS += PYO3_CROSS_PYTHON_VERSION=$(PYTHON3_VERSION)

define Build/Install/Cargo
	( cd $(PKG_BUILD_DIR); \
		$(RUSTC_VARS) RUSTFLAGS="$(RUSTFLAGS)" \
		cargo build $(CARGO_ARGS) --release \
		--manifest-path $(PKG_BUILD_DIR)/Cargo.toml \
		--out-dir $(PKG_BUILD_DIR) \
	)
endef

define Build/Compile
	$(call Py3Build/InstallBuildDepends)
	$(call Build/Install/Cargo)
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/$(PYPI_NAME)
	$(CP) $(PKG_BUILD_DIR)/liborjson.so \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/$(PYPI_NAME)/$(PYPI_NAME).cpython-310.so
	$(call Py3Build/Compile/Default)
endef

$(eval $(call Py3Package,python3-orjson))
$(eval $(call BuildPackage,python3-orjson))
#$(eval $(call BuildPackage,python3-orjson))
