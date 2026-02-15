# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=1.11.5
PKG_RELEASE:=1

PYPI_NAME:=maturin
PKG_HASH:=7579cf47640fb9595a19fe83a742cbf63203f0343055c349c1cab39045a30c29

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=license-apache license-mit
PKG_MAINTAINER:=Entware team, https://entware.net

HOST_BUILD_DEPENDS:= \
	python-setuptools-rust/host \
	python-wheel/host \
	rustc-dev

HOST_BUILD_PARALLEL:=1
HOST_PATCH_DIR:=

PKG_BUILD_DEPENDS:=$(HOST_BUILD_DEPENDS) getrandom-0216 getrandom-034

PKG_BUILD_FLAGS:=no-mips16

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/maturin
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Build and publish crates
  URL:=https://github.com/pyo3/maturin
  DEPENDS:=+python3
  EXTRA_DEPENDS:=rustc
endef

define Package/maturin/description
  Build and publish crates with pyo3, rust-cpython and cffi bindings
  as well as rust binaries as python packages.
endef

$(eval $(call HostBuild))
$(eval $(call Py3Package,maturin))
$(eval $(call BuildPackage,maturin))
