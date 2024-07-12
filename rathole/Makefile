# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rathole
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rapiz1/rathole/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c8698dc507c4c2f7e0032be24cac42dd6656ac1c52269875d17957001aa2de41

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/rathole
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A reverse proxy for NAT traversal
  URL:=https://github.com/rapiz1/rathole
  DEPENDS:=+libopenssl
endef

define Package/rathole/description
  A lightweight and high-performance reverse proxy for NAT traversal,
  written in Rust. An alternative to frp and ngrok.
endef

define Package/rathole/install
	$(INSTALL_DIR) $(1)/opt/etc/rathole
	$(CP) $(PKG_BUILD_DIR)/examples $(1)/opt/etc/rathole
	# remove unused
	rm -fr $(1)/opt/etc/rathole/examples/systemd
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rathole $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rathole))
