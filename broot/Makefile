# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=broot
PKG_VERSION:=1.45.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Canop/broot/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3ce8dcfdc64f03e64547b4413c3d94f47003054aa3e779089393d3e8a7ed3837

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0215 iana-time-zone-0162

define Package/broot
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A new file manager
  URL:=https://dystroy.org/broot
  DEPENDS:=+zlib
  EXTRA_DEPENDS:=git
endef

define Package/broot/description
  A better way to navigate directories.
endef

define Package/broot/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/broot $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,broot))
