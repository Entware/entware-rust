# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hickory-dns
PKG_VERSION:=0.26.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/hickory-dns/hickory-dns/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=22feb683f4eae7f96901f141f88c0e06969504c238482798d1a91231f0ae13bb

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0217 getrandom-034 getrandom-042

define Package/hickory-dns
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A Rust based DNS client, server, and resolver
  URL:=https://hickory-dns.org
# --features="dns-over-openssl"
#  DEPENDS:=+libopenssl
endef

define Package/hickory-dns/description
  A Rust based DNS client, server, and Resolver,
  built to be safe and secure from the ground up.
endef

CARGO_ARGS += \
	--features="https-ring"

define Package/hickory-dns/install
	$(INSTALL_DIR) $(1)/opt/etc/hickory-dns
	$(CP) $(PKG_BUILD_DIR)/tests/test-data/test_configs/example.toml \
		$(1)/opt/etc/hickory-dns/named.toml
	$(INSTALL_DIR) $(1)/opt/usr/bin
	# main
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dns $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hickory-dns $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/recurse $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/resolve $(1)/opt/usr/bin
#	# ext (--features="dns-over-openssl")
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dnskey-to-pem $(1)/opt/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/get-root-ksks $(1)/opt/usr/bin
#	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pem-to-public-dnskey $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/var/lib/named
	$(CP) $(PKG_BUILD_DIR)/tests/test-data/test_configs/* $(1)/opt/var/lib/named
endef

$(eval $(call BuildPackage,hickory-dns))
