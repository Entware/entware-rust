# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=kmon
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orhun/kmon/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=fd8e02c17089e88c2b019e116e0b7fdd9fe4285327bd795de90622aba4b79469

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/kmon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Linux Kernel Manager and Activity Monitor
  URL:=https://kmon.cli.rs
  EXTRA_DEPENDS:=dmesg
endef

define Package/kmon/description
  Linux Kernel Manager and Activity Monitor.
endef

define Package/kmon/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/kmon $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,kmon))
