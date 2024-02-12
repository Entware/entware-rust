# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX armv5/mips(el) (rustdesk-server)

include $(TOPDIR)/rules.mk

PKG_NAME:=async-speed-limit
PKG_VERSION:=0.3.1-1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-06-14
PKG_SOURCE_VERSION:=8d1851d967b1014eb263bae23053a0e513431a9f
PKG_SOURCE_URL:=https://github.com/open-trade/async-speed-limit
PKG_MIRROR_HASH:=404b96d60ac5cc730c53ec286008dc87343996ca50b686a20a97055615814aa8

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-Apache LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/async-speed-limit-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Asynchronously speed-limiting multiple byte streams
  URL:=https://github.com/open-trade/async-speed-limit
  BUILDONLY:=1
endef

define Package/async-speed-limit-$(PKG_VERSION)/description
  Asynchronously speed-limiting multiple byte streams (AsyncRead and AsyncWrite).
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,async-speed-limit-$(PKG_VERSION)))
