# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bat
PKG_VERSION:=0.25.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/bat/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4433403785ebb61d1e5d4940a8196d020019ce11a6f7d4553ea1d324331d8924

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/bat
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a cat(1) clone with wings
  URL:=https://github.com/sharkdp/bat
  DEPENDS:=+zlib
endef

define Package/bat/description
  A cat(1) clone with syntax highlighting and Git integration.
endef

define Package/bat/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bat $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bat))
