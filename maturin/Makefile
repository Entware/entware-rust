# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PYPI_NAME:=maturin
PKG_HASH:=71fdb2dbbd5bcc60bd91ddcbe34dba9f04cc53c2add089a95a79d0d8fc8337b8

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=license-apache license-mit

HOST_BUILD_DEPENDS:=rustc-dev python-setuptools-rust/host python-wheel/host
PKG_HOST_ONLY:=1

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
  DEPENDS:=+python3
  BUILDONLY:=1
endef

define Package/maturin/description
  Build and publish crates with pyo3, rust-cpython and cffi bindings as well
  as rust binaries as python packages.
endef

HOST_PYTHON3_VARS += \
	CARGO_BUILD_TARGET="$(HOST_ARCH)-unknown-linux-gnu" \
	CARGO_HOME="$(STAGING_DIR)/host/share/cargo"

$(eval $(call Py3Package,maturin))
$(eval $(call BuildPackage,maturin))
$(eval $(call HostBuild))
