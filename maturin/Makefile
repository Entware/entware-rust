# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=maturin
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PYPI_NAME:=maturin
PKG_HASH:=f6c69bc7ae147a5effd55587447b35cab1ceb726ba244d08698bc7518b8688ac

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=license-apache license-mit

HOST_BUILD_DEPENDS:=rustc-dev python-setuptools-rust/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk
include ../rust.mk

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
