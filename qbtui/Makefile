# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=qbtui
PKG_VERSION:=0.0.5
PKG_RELEASE:=4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-05-31
PKG_SOURCE_VERSION:=4d8bc838ad423a92765c3b096d5f6b36945e3106
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/pegov/qbtui
PKG_MIRROR_HASH:=6b25b4441b40ab3c805705b2fbedac05e17d3e0949eb18f537b98fe7de8736dc

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

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
