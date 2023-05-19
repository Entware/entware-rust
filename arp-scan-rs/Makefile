# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=arp-scan-rs
PKG_VERSION:=0.13.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kongbytes/arp-scan-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=7a7d7724d4aba297eef1545ff2c6aabd555f85b1ce0eaa954141868939aa1c29

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

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

define Package/arp-scan-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arp-scan $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/arp-scan
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/data/ieee-oui.csv $(1)/opt/share/arp-scan
endef

$(eval $(call BuildPackage,arp-scan-rs))
