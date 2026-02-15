# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=arp-scan-rs
PKG_VERSION:=0.15.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kongbytes/arp-scan-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6d478b47bdf00c2618e414d87af496892c5027a5a3d4a438ab92c084c36fa5b6

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-034

define Package/arp-scan-rs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=arp-scan
  TITLE:=A minimalistic ARP scan tool
  URL:=https://github.com/Saluki/arp-scan-rs
endef

define Package/arp-scan-rs/description
  Find all hosts in your local network using this fast ARP scanner.
  The CLI is written in Rust and provides a minimal scanner that finds all hosts
  using the ARP protocol.
endef

# wget -O $(PKG_BUILD_DIR)/ieee-oui.csv http://standards-oui.ieee.org/oui/oui.csv

define Package/arp-scan-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arp-scan $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/arp-scan
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ieee-oui.csv $(1)/opt/share/arp-scan
endef

$(eval $(call BuildPackage,arp-scan-rs))
