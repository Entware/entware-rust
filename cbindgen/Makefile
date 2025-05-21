# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cbindgen
PKG_VERSION:=0.28.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mozilla/cbindgen/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=620d569c431f8c15b69e1455695cf4be44c11678cc08b25a35b312109baf1980

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=rustc-dev/host

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/rust.mk

HOST_STAMP_INSTALLED:=$(STAGING_DIR)/host/stamp/.$(PKG_DIR_NAME)_installed

define Package/cbindgen
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=A tool for generating C bindings to Rust code
  URL:=https://github.com/mozilla/cbindgen
  BUILDONLY:=1
endef

define Package/cbindgen/description
  cbindgen creates C/C++11 headers for Rust libraries which expose a
 public C API.
endef

Host/Configure:=:

define Host/Compile
	( cd $(HOST_BUILD_DIR); \
		$(RUSTC_HOST_VARS) $(CARGO_BIN) build \
		--release -Z unstable-options \
		--artifact-dir $(HOST_BUILD_DIR)/bins \
		--manifest-path $(HOST_BUILD_DIR)/Cargo.toml \
		$(if $(findstring s,$(OPENWRT_VERBOSE)),--verbose); \
	)
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR)/host/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bins/cbindgen $(STAGING_DIR)/host/bin
endef

define Host/Clean
	rm -f $(STAGING_DIR)/host/bin/cbindgen
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,cbindgen))
