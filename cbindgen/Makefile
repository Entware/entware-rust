# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=cbindgen
PKG_VERSION:=0.29.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mozilla/cbindgen/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=6697f449d4a15d814d991249a611af961c97e36d9344c7ced6df35c5c25b40cc

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
