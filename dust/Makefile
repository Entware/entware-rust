# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dust
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bootandy/dust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e879e6bf662e07cff2962b68529dd78c3bafb67541aaa76e8c9d25ecb505b850

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440

define Package/dust
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=A more intuitive version of du
  URL:=https://crates.io/crates/du-dust
endef

define Package/dust/description
  du + rust = dust. Like du but more intuitive.
endef

define Package/dust/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dust $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dust))
