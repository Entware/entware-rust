# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bat
PKG_VERSION:=0.26.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/bat/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4474de87e084953eefc1120cf905a79f72bbbf85091e30cf37c9214eafcaa9c9

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-031

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
