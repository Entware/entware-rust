# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=eza
PKG_VERSION:=0.21.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eza-community/eza/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=885ae7a12c7ed68dd3a7cca76d4e8beaa100c9e9d6b7ad136b5bb6785e16b28b

PKG_LICENSE:=EUPL-1.2
PKG_LICENSE_FILES:=LICENSE.txt
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0215 iana-time-zone-0162

define Package/eza
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a modern replacement for ls
  URL:=https://eza.rocks
  DEPENDS:=+zlib
endef

define Package/eza/description
  eza is a modern, maintained replacement for ls, built on exa.
endef

define Package/eza/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/eza $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,eza))
