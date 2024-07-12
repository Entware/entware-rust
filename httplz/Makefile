# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=http
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/thecoshman/http/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f9f634949c1243918c30e73b116819760646d65d24f026a59879ac037a8c877c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/httplz
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=a basic http server for hosting a folder fast and simply
  URL:=https://github.com/thecoshman/http
  DEPENDS:=+libopenssl
endef

define Package/httplz/description
  Host These Things Please - a basic HTTP server for hosting a folder
  fast and simply.
endef

define Package/httplz/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/httplz $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,httplz))
