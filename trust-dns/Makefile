# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX The latest version.
# For details, see: https://www.memorysafety.org/blog/announcing-hickory-dns/

include $(TOPDIR)/rules.mk

PKG_NAME:=trust-dns
PKG_VERSION:=0.23.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bluejekyll/trust-dns/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8e42149735e43e3a0c8db27d152e8e43c8bb2c59ac6d7f7feb115347eb8fa8d2

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += quinn-0104
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/trust-dns
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A Rust based DNS client, server, and resolver
  URL:=https://trust-dns.org
  DEPENDS:=+libopenssl
endef

define Package/trust-dns/description
  A Rust based DNS client, server, and Resolver, built to be safe
  and secure from the ground up.
endef

CARGO_ARGS += \
	--features="dnssec-openssl,dnssec-ring"

define Package/trust-dns/install
	$(INSTALL_DIR) $(1)/opt/etc/trust-dns
	$(CP) $(PKG_BUILD_DIR)/tests/test-data/test_configs/example.toml \
		$(1)/opt/etc/trust-dns/named.toml
	$(INSTALL_DIR) $(1)/opt/usr/bin
	# main
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dns $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/recurse $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/resolve $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/trust-dns $(1)/opt/usr/bin
	# ext (--features="dns-over-openssl")
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dnskey-to-pem $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/get-root-ksks $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pem-to-public-dnskey $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/var/lib/named
	$(CP) $(PKG_BUILD_DIR)/tests/test-data/test_configs/* $(1)/opt/var/lib/named
endef

Build/InstallDev:=:

$(eval $(call BuildPackage,trust-dns))
