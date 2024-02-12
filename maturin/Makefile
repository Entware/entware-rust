# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PYPI_NAME:=maturin
PKG_HASH:=ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=license-apache license-mit

HOST_BUILD_DEPENDS:=rustc-dev python-setuptools-rust/host python-wheel/host

RUST_MIN_SIZE:=0

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk
include ../rustc-dev/rust.mk

PKG_BUILD_DEPENDS += $(HOST_BUILD_DEPENDS)

define Package/maturin
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Build and publish crates
  URL:=https://github.com/pyo3/maturin
  DEPENDS:=+python3 +rustc
endef

define Package/maturin/description
  Build and publish crates with pyo3, rust-cpython and cffi bindings as well
  as rust binaries as python packages.
endef

HOST_PYTHON3_VARS += \
	CARGO_BUILD_TARGET="$(HOST_ARCH)-unknown-linux-gnu" \
	CARGO_HOME="$(CARGO_HOME)"

RUSTFLAGS += -C relocation-model=pic

PYTHON3_PKG_SETUP_VARS += \
	CARGO_BUILD_TARGET="$(RUST_TARGET_TRIPLE)" \
	CARGO_HOME="$(CARGO_HOME)" \
	RUSTFLAGS="$(RUSTFLAGS)"

$(eval $(call Py3Package,maturin))
$(eval $(call BuildPackage,maturin))
$(eval $(call HostBuild))
