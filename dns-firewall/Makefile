# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dns-firewall
PKG_VERSION:=1.2.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/nthuemmel/dns-firewall-rust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1de85d0be79dc65ec4823a9eb91fd0cf6cb7c9d19d18a93a183a4f6660dc8519

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/dns-firewall
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Firewall
  TITLE:=Filtering DNS proxy server with firewall integration
  URL:=https://github.com/nthuemmel/dns-firewall-rust
  EXTRA_DEPENDS:=iptables, ipset
endef

define Package/dns-firewall/description
  dns-firewall is a filtering DNS proxy server integrating into iptables
  firewalls written in Rust.
endef

define Package/dns-firewall/conffiles
/opt/etc/dns-firewall/acl
endef

define Package/dns-firewall/install
	$(INSTALL_DIR) $(1)/opt/etc/dns-firewall
	$(CP) $(PKG_BUILD_DIR)/dist/shared/etc/dns-firewall/acl $(1)/opt/etc/dns-firewall
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dns-firewall $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dns-firewall))
