# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bottom
PKG_VERSION:=0.10.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ClementTsang/bottom/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=1db45fe9bc1fabb62d67bf8a1ea50c96e78ff4d2a5e25bf8ae8880e3ad5af80a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/bottom
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Yet another graphical process/system monitor
  URL:=https://clementtsang.github.io/bottom/
endef

define Package/bottom/description
  A cross-platform graphical process/system monitor with a
  customizable interface and a multitude of features. Supports Linux,
  macOS, and Windows. Inspired by both gtop and gotop.
endef

define Package/bottom/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/btm $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bottom))
