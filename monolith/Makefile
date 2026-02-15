# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=monolith
PKG_VERSION:=2.10.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Y2Z/monolith/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1afafc94ba693597f591206938e998fcf2c78fd6695e7dfd8c19e91061f7b44a

PKG_LICENSE:=CC0-1.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-032 iana-time-zone-0162 openssl-probe-016

define Package/monolith
  SECTION:=net
  CATEGORY:=Network
  TITLE:=CLI tool for saving web pages as a single HTML file
  URL:=https://github.com/orf/monolith
  DEPENDS:=+libopenssl
endef

define Package/monolith/description
  CLI tool and library for saving complete web pages as a single HTML
 file.
endef

RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/monolith/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/monolith $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,monolith))
