# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=arp-scan-rs
PKG_VERSION:=0.14.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kongbytes/arp-scan-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9cd8ae882d47aef59f79ceedc797a9697b0f1b81916488a43a84b0a807b482fa

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/arp-scan-rs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=arp-scan
  TITLE:=A minimalistic ARP scan tool
  URL:=https://github.com/Saluki/arp-scan-rs
endef

define Package/arp-scan-rs/description
  Find all hosts in your local network using this fast ARP scanner.
  The CLI is written in Rust and provides a minimal scanner that
  finds all hosts using the ARP protocol.
endef

define GetDB
	wget -O $(PKG_BUILD_DIR)/ieee-oui.csv http://standards-oui.ieee.org/oui/oui.csv
endef
Hooks/Compile/Pre += GetDB

define Package/arp-scan-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arp-scan $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/arp-scan
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ieee-oui.csv $(1)/opt/share/arp-scan
endef

$(eval $(call BuildPackage,arp-scan-rs))
