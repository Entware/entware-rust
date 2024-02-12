# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=warpy
PKG_VERSION:=0.3.35
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mihaigalos/warpy/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=ebb808bae19f0e35dcb02d4fdfcb18ede01b7f034f7d489a65a47fa632f38d02

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 rcgen-0113 warp-036

define Package/warpy-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A thin warp wrapper for serving folders over http
  URL:=https://github.com/mihaigalos/rustls
  BUILDONLY:=1
endef

define Package/warpy-$(PKG_VERSION)/description
  A thin warp wrapper for serving folders over http.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,warpy-$(PKG_VERSION)))
