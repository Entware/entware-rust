# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ugdb
PKG_VERSION:=0.1.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ftilde/ugdb/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=f3bd6d36c930dcdcd4f80d03ee1883f8312f5de04e1240ba78e990a2bec58d72

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 iana-time-zone-0161 raw-tty-010

define Package/ugdb
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=An alternative TUI for gdb
  URL:=https://github.com/ftilde/ugdb
  EXTRA_DEPENDS:=gdb
endef

define Package/ugdb/description
  ugdb is an unsegen based alternative TUI for gdb.
endef

define Package/ugdb/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ugdb $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ugdb))
