# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PYPI_NAME:=maturin
PKG_HASH:=1ba5277dd7832dc6181d69a005182b97b3520945825058484ffd9296f2efb59c

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=license-apache license-mit
PKG_MAINTAINER:=Entware team, https://entware.net

HOST_BUILD_DEPENDS:=python-setuptools-rust/host python-wheel/host
PKG_BUILD_DEPENDS:=$(HOST_BUILD_DEPENDS)

PKG_BUILD_FLAGS:=no-mips16

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/maturin
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Build and publish crates
  URL:=https://github.com/pyo3/maturin
  DEPENDS:=+python3 +rustc
endef

define Package/maturin/description
  Build and publish crates with pyo3, rust-cpython and cffi bindings
  as well as rust binaries as python packages.
endef

define Package/maturin/postrm
#!/bin/sh

rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)
rm -rf $(PYTHON3_PKG_DIR)/$(PYPI_NAME)-$(PKG_VERSION).dist-info
endef

$(eval $(call Py3Package,maturin))
$(eval $(call BuildPackage,maturin))
$(eval $(call HostBuild))
