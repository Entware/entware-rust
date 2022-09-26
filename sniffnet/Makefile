# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sniffnet
PKG_VERSION:=0.4.0
PKG_RELEASE:=1
PKG_SOURCE_DATE:=2022-09-24
PKG_SOURCE_VERSION:=85ece76a3981f7526e42e05711721be561085c00

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/GyulyVGC/sniffnet
PKG_MIRROR_HASH:=8ed89f71635eca26fa434ab0d4de722e0cb86ea482250a12e23761afea62d28a

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
endef

define Package/sniffnet/description
  Framework to explore network traffic through graphical and textual reports.
endef

define Package/sniffnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sniffnet $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,sniffnet))
