# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=deno
PKG_VERSION:=2.6.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/denoland/deno/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=071425551803cf3afeec33428c1a494424de4fdbe7001001023100ac6bbb7452

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

HOST_BUILD_DEPENDS:=rustc-dev/host

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/rust.mk

HOST_UNPACK += --strip-components=1 -C $(HOST_BUILD_DIR)

define Package/deno
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=A modern runtime for JavaScript and TypeScript
  URL:=https://deno.com
  BUILDONLY:=1
endef

define Package/deno/description
  A modern runtime for JavaScript and TypeScript.
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
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bins/deno $(STAGING_DIR_HOSTPKG)/bin
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOSTPKG)/bin/deno
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,deno))
