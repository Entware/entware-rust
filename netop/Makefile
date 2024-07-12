# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=netop
PKG_VERSION:=0.1.4
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ZingerLittleBee/netop/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c860c0b0fa906276e6563c338dc2d8b1b2866a334dc0bf7c640549bab30085c4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0434

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

ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

PCAP_PKG=$(TOPDIR)/package/libs/libpcap/Makefile
PCAP_VER=$(shell grep '^PKG_VERSION' $(PCAP_PKG) | cut -d= -f2)

RUSTC_VARS += \
	LIBPCAP_LIBDIR=$(STAGING_DIR)/opt/lib \
	LIBPCAP_VER="$(PCAP_VER)"

define Package/netop/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/netop $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,netop))
