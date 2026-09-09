# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zenith
PKG_VERSION:=0.15.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bvaisvil/zenith/tar.gz/$(PKG_VERSION)?
PKG_HASH:=ffa3412c19e99f9ef691f86e4f9b1a342add2b0504bb3ea7f0b57daa17e4b731

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-0216 iana-time-zone-0163

RUSTFLAGS += --cfg rustix_use_libc

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
