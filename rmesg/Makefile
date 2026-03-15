# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rmesg
PKG_VERSION:=1.0.24
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/archisgore/rmesg/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=8ca062999aabe17bc58aedeb2a20e195862d7ec18e8558364ef60702ac5a7c20

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-033

define Package/rmesg
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A 'dmesg' implementation in Rust
  URL:=https://github.com/archisgore/rmesg
endef

define Package/rmesg/description
  This is a fully Rust-based implementation of the popular dmesg Linux
  utility, giving programmatic access to the kernel log buffer.
endef

define Package/rmesg/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rmesg $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rmesg))
