# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=diskonaut
PKG_VERSION:=0.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/imsnif/diskonaut/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=355367dbc6119743d88bfffaa57ad4f308596165a57acc2694da1277c3025928

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/diskonaut
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=Terminal disk space visual navigator
  URL:=https://github.com/imsnif/diskonaut
endef

define Package/diskonaut/description
  Terminal disk space visual navigator.
endef

define Package/diskonaut/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/diskonaut $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,diskonaut))
