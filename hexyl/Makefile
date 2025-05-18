# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hexyl
PKG_VERSION:=0.16.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/hexyl/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=52853b4edede889b40fd6ff132e1354d957d1f26ee0c26ebdea380f8ce82cb0b

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/hexyl
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A command-line hex viewer
  URL:=https://github.com/sharkdp/hexyl
endef

define Package/hexyl/description
  hexyl is a simple hex viewer for the terminal. It uses a colored
  output to distinguish different categories of bytes (NULL bytes,
  printable ASCII characters, ASCII whitespace characters, other
  ASCII characters and non-ASCII).
endef

define Package/hexyl/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hexyl $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,hexyl))
