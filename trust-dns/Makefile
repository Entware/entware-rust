# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=trust-dns
PKG_VERSION:=0.23.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bluejekyll/trust-dns/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=258c33f0d0e6a6007afcce1dd9453b14bf4d4f074111ec4488f24be0f11645dd

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += quinn-0104 ring-0175 rustls-0219 rustls-webpki-01017 \
	tokio-rustls-0241 webpki-roots-0243

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
