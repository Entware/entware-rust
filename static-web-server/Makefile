# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=static-web-server
PKG_VERSION ?=
PKG_RELEASE ?=

# XXX ^2.x depends on "ring"
ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  PKG_VERSION:=1.19.4
  PKG_RELEASE:=1
  PKG_HASH:=f4c3c773963b49bb026d0ba15c7d8a67a3e377ccd81b1f786c117cb292f11aa3
else
  PKG_VERSION:=2.14.2
  PKG_RELEASE:=1
  PKG_HASH:=036bf87f97de806cdb84ec03f0647f2619fc0f1defaa76bcb6b6a1508aa8a3a0
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/joseluisq/static-web-server/tar.gz/refs/tags/v$(PKG_VERSION)?

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/static-web-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Static Web Server
  URL:=https://sws.joseluisq.net/
  DEPENDS:=+libopenssl
endef

define Package/static-web-server/description
  A blazing fast and asynchronous web server for static files-serving.
endef

RUSTC_VARS += \
	OPENSSL_NO_VENDOR=1

define Package/static-web-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/static-web-server $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,static-web-server))
