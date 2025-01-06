# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (wstunnel)

include $(TOPDIR)/rules.mk

PKG_NAME:=bb8
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/djc/bb8/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9d0e004c469634b7770e5573972c23dd40b89d7d54f1a9610e2df9bbbe925cbf

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/bb8-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Full-featured async connection pool
  URL:=https://github.com/djc/bb8
  BUILDONLY:=1
endef

define Package/bb8-$(PKG_VERSION)/description
  A full-featured connection pool, designed for asynchronous
  connections (using tokio). Originally based on r2d2.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,bb8-$(PKG_VERSION)))
