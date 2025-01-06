# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=wstunnel
PKG_VERSION:=10.1.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erebe/wstunnel/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6717e361d5810349cdc30e3ce78e0883bdad3c55c228a7684dc5dff856419124

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += aws-lc-sys-0212 bb8-090 chrono-0438 iana-time-zone-0161

define Package/wstunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tunneling over websocket protocol
  URL:=https://github.com/erebe/wstunnel
  DEPENDS:=+ca-certificates
endef

define Package/wstunnel/description
  Tunnel all your traffic over Websocket or HTTP2.
endef

define Package/wstunnel/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wstunnel $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wstunnel))
