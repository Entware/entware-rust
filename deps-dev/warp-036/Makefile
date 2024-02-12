# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=warp
PKG_VERSION:=0.3.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/seanmonstar/warp/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e72145da6846a86cc47796acf0a114f919c27dc33450f5ff75d6db521db81f88

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += tokio-rustls-0241

define Package/warp-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=serve the web at warp speeds
  URL:=https://github.com/seanmonstar/rustls
  BUILDONLY:=1
endef

define Package/warp-$(PKG_VERSION)/description
  A super-easy, composable, web server framework for warp speeds.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,warp-$(PKG_VERSION)))
