# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bindgen
PKG_VERSION:=0.71.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rust-lang/rust-bindgen/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=620d80c32b6aaf42d12d85de86fc56950c86b2a13a5b943c10c29d30c4f3efb0

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=rustc-dev/host

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/rust.mk

HOST_UNPACK += --strip-components=1 -C $(HOST_BUILD_DIR)
HOST_STAMP_INSTALLED:=$(STAGING_DIR)/host/stamp/.$(PKG_DIR_NAME)_installed

define Package/bindgen
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Generate Rust bindings for C and C++ libraries
  URL:=https://github.com/rust-lang/rust-bindgen
  BUILDONLY:=1
endef

define Package/bindgen/description
  Automatically generates Rust FFI bindings to C and C++ libraries.
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
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/bins/bindgen $(STAGING_DIR)/host/bin
endef

define Host/Clean
	rm -f $(STAGING_DIR)/host/bin/bindgen
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,bindgen))
