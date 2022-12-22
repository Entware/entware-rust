# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sniffnet
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/GyulyVGC/sniffnet/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c957a372b324aa8349820458202d291f64831b90aeae5b73d822e74e7739876d

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/sniffnet
  SECTION:=net
  CATEGORY:=Network
  TITLE:=application to analyze and filter network traffic
  URL:=https://github.com/GyulyVGC/sniffnet
  DEPENDS:=+fontconfig +libpcap +libstdcpp
endef

define Package/sniffnet/description
  Framework to explore network traffic through graphical and textual reports.
endef

define Package/sniffnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sniffnet $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,sniffnet))
