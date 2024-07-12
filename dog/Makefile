# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dog
PKG_VERSION:=0.1.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ogham/dog/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=82387d38727bac7fcdb080970e84b36de80bfe7923ce83f993a77d9ac7847858

PKG_LICENSE:=EUPL-1.2
PKG_LICENSE_FILES:=LICENSE

USE_CARGO_LOCK:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/dog
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  TITLE:=A command-line DNS client
  URL:=https://dns.lookup.dog
  DEPENDS:=+libopenssl
endef

define Package/dog/description
  dog is a command-line DNS client, like dig.
  It has colourful output, understands normal command-line argument syntax,
  supports the DNS-over-TLS and DNS-over-HTTPS protocols, and can emit JSON.
endef

define Package/dog/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dog $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dog))
