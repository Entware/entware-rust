# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bingrep
PKG_VERSION:=0.12.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/m4b/bingrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8bf096df68736561b40f56cd1feb4834014cd11c0a28b33e74e818618c62e100

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0216

define Package/bingrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Cross-platform binary parser and colorizer
  URL:=https://github.com/m4b/bingrep
endef

define Package/bingrep/description
  Greps through binaries from various OSs and architectures, and colors them.
endef

define Package/bingrep/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bingrep $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bingrep))
