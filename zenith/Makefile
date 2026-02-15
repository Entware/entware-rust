# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zenith
PKG_VERSION:=0.14.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bvaisvil/zenith/tar.gz/$(PKG_VERSION)?
PKG_HASH:=b092048d1a9ce7234584d928e4b103aaaa7e47589923cf4e48dfa8919b3f8d88

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-0216 iana-time-zone-0163

define Package/zenith
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=soft of like top or htop
  URL:=https://github.com/bvaisvil/zenith
endef

define Package/zenith/description
  In terminal graphical metrics for your *nix system written in Rust.
endef

define Package/zenith/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zenith $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zenith))
