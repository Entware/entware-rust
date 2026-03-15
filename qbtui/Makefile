# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=qbtui
PKG_REAL_VERSION:=0.0.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2026-02-04
PKG_SOURCE_VERSION:=49122393b20506cb654d5f84a2a8fc420b67f214
PKG_SOURCE_URL:=https://github.com/pegov/qbtui
PKG_MIRROR_HASH:=1bc765ec8d1e443f6ee8149702555e3ed3b61340698267dbf54d333ee2789a29

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-033

define Package/qbtui
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=BitTorrent
  TITLE:=A terminal user interface for qBittorrent
  URL:=https://github.com/pegov/qbtui
  DEPENDS:=+libopenssl
endef

define Package/qbtui/description
  Manage torrents and open files from terminal.
endef

define Package/qbtui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/qbtui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,qbtui))
