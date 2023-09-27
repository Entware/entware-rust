# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=qbtui
PKG_VERSION:=0.0.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-05-31
PKG_SOURCE_VERSION:=4d8bc838ad423a92765c3b096d5f6b36945e3106
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/pegov/qbtui
PKG_MIRROR_HASH:=841bc27b6d2e97c74f0eee7f6794ce45439a204d0f19cf6bc87b40e147f34f86

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/qbtui
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=BitTorrent
  TITLE:=A terminal user interface for qBittorrent
  URL:=https://github.com/pegov/qbtui
  DEPENDS:=+libopenssl
  EXTRA_DEPENDS:=qbittorrent
endef

define Package/qbtui/description
  Manage torrents and open files from terminal.
endef

define Package/qbtui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/qbtui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,qbtui))
