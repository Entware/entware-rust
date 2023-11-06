# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=rpds-py
PKG_VERSION:=0.10.6
PKG_RELEASE:=1

PYPI_NAME:=rpds-py
PYPI_SOURCE_NAME:=rpds_py
PKG_HASH:=4ce5a708d65a8dbf3748d2474b580d606b1b9f91b5c6ab2a316e0b0cf7a4ba50

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include ../rust.mk

PKG_BUILD_DEPENDS += maturin/host

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

PYTHON3_PKG_SETUP_VARS += \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)" \
	CARGO_HOME="$(CARGO_HOME)" \
	PYO3_CROSS_LIB_DIR=$(STAGING_DIR)/opt/lib \
	PYO3_CROSS_PYTHON_VERSION=$(PYTHON3_VERSION)

define Package/python3-rpds-py/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_SOURCE_NAME)-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,python3-rpds-py))
$(eval $(call BuildPackage,python3-rpds-py))
#$(eval $(call BuildPackage,python3-rpds-py-src))