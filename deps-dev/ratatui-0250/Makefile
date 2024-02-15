# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX (xplr)

include $(TOPDIR)/rules.mk

PKG_NAME:=ratatui
PKG_VERSION:=0.25.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ratatui-org/ratatui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9884a3dc509cb7bae2af7bb29a56f8f244c7424e1841d8ae46926cdca1532d7c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/ratatui-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A library that's all about cooking up terminal user interfaces
  URL:=https://ratatui.rs
  BUILDONLY:=1
endef

define Package/ratatui-$(PKG_VERSION)/description
  Rust library that's all about cooking up
  terminal user interfaces (TUIs).
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,ratatui-$(PKG_VERSION)))
