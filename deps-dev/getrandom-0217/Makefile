# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# all (no SYS_getrandom)

include $(TOPDIR)/rules.mk

PKG_NAME:=getrandom
PKG_VERSION:=0.2.17
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rust-random/getrandom/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8bfb833a39c77750c15eccd26da0f2a367a2fca463a272ac683840b16e7984ec

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/getrandom-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=system's random number generator
  URL:=https://github.com/rust-random/getrandom
  BUILDONLY:=1
endef

define Package/getrandom-$(PKG_VERSION)/description
 A small cross-platform library for retrieving random data from
 system source.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,getrandom-$(PKG_VERSION)))
