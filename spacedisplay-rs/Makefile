# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=spacedisplay-rs
PKG_VERSION:=0.3.0
PKG_RELEASE:=6

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/funbiscuit/spacedisplay-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2f202d7e29bfb784d23d7dc841a2bff52335c5aef3aa96e37e63632e8121627c

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 iana-time-zone-0164 mountpoints-rs-021

define Package/spacedisplay-rs
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=fast and lightweight tool to scan your disk space
  URL:=https://github.com/funbiscuit/spacedisplay-rs
endef

define Package/spacedisplay-rs/description
  Fast and lightweight tool to scan your disk space.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

define Package/spacedisplay-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/spacedisplay $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,spacedisplay-rs))
