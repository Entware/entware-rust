# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=static-web-server
PKG_VERSION:=1.19.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/joseluisq/static-web-server/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f4c3c773963b49bb026d0ba15c7d8a67a3e377ccd81b1f786c117cb292f11aa3

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/static-web-server-legacy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Static Web Server
  URL:=https://sws.joseluisq.net/
  DEPENDS:=@(mips||mipsel) +libopenssl
  PROVIDES:=static-web-server
endef

define Package/static-web-server-legacy/description
  A blazing fast and asynchronous web server for static files-serving.
endef

RUSTC_VARS += \
	OPENSSL_NO_VENDOR=1

define Package/static-web-server-legacy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/static-web-server $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,static-web-server-legacy))
