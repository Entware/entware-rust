# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mprocs
PKG_VERSION:=0.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pvolok/mprocs/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=e0e91097399b751df42558c3717e6be130bfd523612c772dd1e3f9070eddbc5e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 getrandom-032 iana-time-zone-0159

define Package/mprocs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=TUI for running multiple processes
  URL:=https://github.com/pvolok/mprocs
endef

define Package/mprocs/description
  mprocs runs multiple commands in parallel and shows output of
  each command separately.
endef

define Package/mprocs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/mprocs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,mprocs))
