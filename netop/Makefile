# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=netop
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ZingerLittleBee/netop/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e1036dccad34b3b7aab1fa66dc411c7337c81ea44502245a61cf81c63d60375f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/netop
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Network Top
  URL:=https://github.com/ZingerLittleBee/netop
  DEPENDS:=+libpcap
endef

define Package/netop/description
  netop is a terminal command line interface that can customize
  the filter network traffic rule.
endef

PCAP_PKG=$(TOPDIR)/package/libs/libpcap/Makefile
PCAP_VER=$(shell grep '^PKG_VERSION' $(PCAP_PKG) | cut -f2 -d'=')

RUSTC_VARS += \
	LIBPCAP_LIBDIR=$(STAGING_DIR)/opt/lib \
	LIBPCAP_VER="$(PCAP_VER)"

define Package/netop/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/netop $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,netop))
