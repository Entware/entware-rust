# SPDX-License-Identifier: WTFPL

# XXX since 1.0.0 needs libX11.so

include $(TOPDIR)/rules.mk

PKG_NAME:=sniffnet
PKG_VERSION:=0.5.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/GyulyVGC/sniffnet/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4a791e9c1bbcc1b805312699224b16da637bfc62c552d1414610f6ceb3863ddf

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/sniffnet
  SECTION:=net
  CATEGORY:=Network
  TITLE:=application to analyze and filter network traffic
  URL:=https://github.com/GyulyVGC/sniffnet
  DEPENDS:=+fontconfig +libpcap
  EXTRA_DEPENDS:=dejavu-fonts-ttf-DejaVuSerif
endef

define Package/sniffnet/description
  Framework to explore network traffic through graphical and textual reports.
endef

define Package/sniffnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sniffnet $(1)/opt/usr/bin
endef

define Package/sniffnet/postinst
#!/bin/sh

fc-cache -f
endef

$(eval $(call BuildPackage,sniffnet))
