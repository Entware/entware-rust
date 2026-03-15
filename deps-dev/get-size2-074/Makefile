# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

# XXX mips(el) (ruff)

include $(TOPDIR)/rules.mk

PKG_NAME:=get-size2
PKG_VERSION:=0.7.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bircni/get-size2/tar.gz/$(PKG_VERSION)?
PKG_HASH:=22ee2e99ec5280ddb3f50b347fd12faf2e42c5678e65d64de1fd2d43618e9e0b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442

define Package/get-size2-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Determine the size in bytes an object occupies inside RAM
  URL:=https://github.com/bircni/get-size2
  BUILDONLY:=1
endef

define Package/get-size2-$(PKG_VERSION)/description
  Determine the size in bytes an object occupies inside RAM.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,get-size2-$(PKG_VERSION)))
