# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=mprocs
PKG_VERSION:=0.7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pvolok/mprocs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=13059e3f474b17b0d806b2b6a79c17dd9b817793a0a6442ffd43ddaacb1db60c

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
