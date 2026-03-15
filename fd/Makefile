# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=fd
PKG_VERSION:=10.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/fd/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=3a7e027af8c8e91c196ac259c703d78cd55c364706ddafbc66d02c326e57a456

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-042

define Package/fd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a simple, fast and user-friendly alternative to find
  URL:=https://github.com/sharkdp/fd
endef

define Package/fd/description
  fd is a program to find entries in your filesystem.
  It is a simple, fast and user-friendly alternative to 'find'.
endef

define Package/fd/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/fd $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,fd))
