# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

# XXX arm64/mips(el) (cyme)

include $(TOPDIR)/rules.mk

PKG_NAME:=udevrs
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cr8t/udev/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9d1bacde189c207cbf4039021293a5c0c6dc36bd8fd5319d118d89f7a00c2ee7

PKG_LICENSE:=LGPL-2.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/udevrs-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Pure Rust implementation of the user-land udev library
  URL:=https://github.com/cr8t/udev
  BUILDONLY:=1
endef

define Package/udevrs-$(PKG_VERSION)/description
  Pure Rust implementation of the user-land udev library.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,udevrs-$(PKG_VERSION)))
