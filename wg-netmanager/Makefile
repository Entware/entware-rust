# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=wg_netmanager
PKG_VERSION:=0.5.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/gin66/wg_netmanager/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=882093b6162cc8abdea671ea36d2dbb07ea0c5bc75bd6330371e9e42d1045b04

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/wg-netmanager
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Wireguard network manager
  URL:=https://github.com/gin66/wg_netmanager
#  EXTRA_DEPENDS:=ip-full, wireguard-tools
endef

define Package/wg-netmanager/description
  Wireguard network manager.
endef

define Package/wg-netmanager/conffiles
/opt/etc/wg_netmanager/network.yaml
/opt/etc/wg_netmanager/peer.yaml
endef

define Package/wg-netmanager/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wg_netmanager $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/wg_netmanager
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/{network,peer}.yaml $(1)/opt/etc/wg_netmanager
endef

$(eval $(call BuildPackage,wg-netmanager))
