# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mprocs
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pvolok/mprocs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=17dcb04d2d7caf8c1263b124cf5ecb145d28ac6d0717c2de78c988858c0572af

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

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
