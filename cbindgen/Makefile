# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cbindgen
PKG_VERSION:=0.29.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mozilla/cbindgen/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=c7d4d610482390c70e471a5682de714967e187ed2f92f2237c317a484a8c7e3a

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=rustc-dev/host

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/rust.mk

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
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bins/cbindgen $(STAGING_DIR_HOSTPKG)/bin
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOSTPKG)/bin/cbindgen
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,cbindgen))
