# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=http
PKG_VERSION:=1.13.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/thecoshman/http/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=dd82d4db8e9a97e2fb09909d85c03a1d596b110c03c84b52b428f615d1041682

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/httplz
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=a basic http server for hosting a folder fast and simply
  URL:=https://github.com/thecoshman/http
  DEPENDS:=+libopenssl
endef

define Package/httplz/description
  Host These Things Please - a basic HTTP server
  for hosting a folder fast and simply.
endef

define Package/httplz/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/httplz $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,httplz))
