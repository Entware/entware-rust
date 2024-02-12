# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sct
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/sct.rs/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=e003755b54ebe70fdc1246c3a829f0e7b7fa11209feed3af3934dcebd80db9cc

PKG_LICENSE:=Apache-2.0 ISC MIT
PKG_LICENSE_FILES:=LICENSE LICENSE-APACHE LICENSE-ISC LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/sct-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Certificate transparency SCT verification library
  URL:=https://github.com/rustls/sct.rs
  BUILDONLY:=1
endef

define Package/sct-$(PKG_VERSION)/description
  Certificate transparency SCT verification library in rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,sct-$(PKG_VERSION)))
