# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `coarsetime` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=arti
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.torproject.org/tpo/core/arti/-/archive/$(PKG_NAME)-v$(PKG_VERSION)
PKG_HASH:=dd841bfb9e9c11d77ae5ed136d3f0e7a3af570cce5dc0164bbb7f5ea9c26708d

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=GPL-3 LGPL-3 LICENSE-APACHE LICENSE-MIT
PKG_MAINTAINER:=Entware team, https://entware.net

#PKG_CONFIG_DEPENDS:= \
#	CONFIG_ARTI_EXPERIMENTAL

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 coarsetime-0134 iana-time-zone-0161 merlin-300 openssl-probe-015
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/arti/Default
  SECTION:=net
  CATEGORY:=Network
  URL:=https://gitlab.torproject.org/tpo/core/arti/-/wikis/home
endef

define Package/arti
  $(call Package/arti/Default)
  TITLE:=A rust implementation of the Tor privacy tools
  DEPENDS+=+liblzma +libopenssl +libsqlite3
endef

define Package/arti/description
  A rust implementation of the Tor privacy tools.
endef

define Package/arti-bench
  $(call Package/arti/Default)
  TITLE:=A simple benchmarking utility for Arti
  DEPENDS:=+arti
endef

define Package/arti-bench/description
  A simple benchmarking utility for Arti.
endef

define Package/arti-testing
  $(call Package/arti/Default)
  TITLE:=Tools for testing the Arti Tor implementation
  DEPENDS:=+arti
endef

define Package/arti-testing/description
  Tools for testing the Arti Tor implementation.
endef

define Package/arti-connection-checker
  $(call Package/arti/Default)
  TITLE:=Test connections to the Tor network
  DEPENDS:=+arti
endef

define Package/arti-connection-checker/description
  This small tool attempts to check connectivity to the
  Tor network through a variety of ways:
  - Directly
  - Via a bridge
  - Via various pluggable transports (obfs4, meek-azure, snowflake)
endef

define Package/arti-dns-resolver
  $(call Package/arti/Default)
  TITLE:=Use Tor to make a DNS over TCP request
  DEPENDS:=+arti
endef

define Package/arti-dns-resolver/description
  Use Tor to make a DNS over TCP request for a hostname,
  and get IP addresses back.
endef

define Package/arti-download-manager
  $(call Package/arti/Default)
  TITLE:=a small download manager prototype
  DEPENDS:=+arti
endef

define Package/arti-download-manager/description
  This project aims to build a small download manager
  prototype which can connect to the Tor network and get a copy of the Tor
  browser from there.
endef

define Package/arti-obfs4-checker
  $(call Package/arti/Default)
  TITLE:=Utility to deliver real-time updates on bridge health
  DEPENDS:=+arti
endef

define Package/arti-obfs4-checker/description
  This small tool attempts to check obfs4 bridge status
  over a long period of time.
endef

define Package/arti-pt-proxy
  $(call Package/arti/Default)
  TITLE:=Tunnel SOCKS5 traffic through obfs4 connection
  DEPENDS:=+arti
endef

define Package/arti-pt-proxy/description
  This is a project that provides an interface to run
  the obfs4 pluggable transport in a standalone manner, ie, instead of
  using obfs4 to connect to the Tor network, we can use it to connect
  to the Internet directly.
endef

define Package/arti/conffiles
/opt/etc/arti/arti.toml
endef

#define Package/arti/config
#config ARTI_EXPERIMENTAL
#	depends on PACKAGE_arti
#	bool "Enable experimental APIs that are not yet officially supported."
#endef

#CARGO_ARGS += $(if $(CONFIG_ARTI_EXPERIMENTAL),--features 'experimental')

define Package/arti/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arti $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/etc/arti
	$(CP) $(PKG_BUILD_DIR)/crates/arti/src/arti-example-config.toml \
		$(1)/opt/etc/arti/arti.toml
endef

define Package/arti-bench/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arti-bench $(1)/opt/usr/bin
endef

define Package/arti-testing/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/arti-testing $(1)/opt/usr/bin
endef

define Package/arti-connection-checker/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/connection-checker $(1)/opt/usr/bin
endef

define Package/arti-dns-resolver/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dns-resolver $(1)/opt/usr/bin
endef

define Package/arti-download-manager/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/download-manager $(1)/opt/usr/bin
endef

define Package/arti-obfs4-checker/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/obfs4-checker $(1)/opt/usr/bin
endef

define Package/arti-pt-proxy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pt-proxy $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,arti))
#$(eval $(call BuildPackage,arti-bench))
#$(eval $(call BuildPackage,arti-connection-checker))
#$(eval $(call BuildPackage,arti-dns-resolver))
#$(eval $(call BuildPackage,arti-download-manager))
#$(eval $(call BuildPackage,arti-obfs4-checker))
#$(eval $(call BuildPackage,arti-pt-proxy))
$(eval $(call BuildPackage,arti-testing))
