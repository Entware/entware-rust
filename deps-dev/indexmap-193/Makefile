# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=indexmap
PKG_VERSION:=1.9.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bluss/indexmap/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=9d27e02f3d252bd423f26539b7e44de44d3ab5b00191ae25e3910dc976e9a4d6

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/indexmap-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A hash table with consistent order and fast iteration
  URL:=https://github.com/bluss/rustls
  BUILDONLY:=1
endef

define Package/indexmap-$(PKG_VERSION)/description
  A hash table with consistent order and fast iteration;
  access items by key or sequence index.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,indexmap-$(PKG_VERSION)))
