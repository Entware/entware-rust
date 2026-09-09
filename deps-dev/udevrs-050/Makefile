# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

# XXX arm64/mips(el) (cyme)

include $(TOPDIR)/rules.mk

PKG_NAME:=udevrs
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cr8t/udev/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ec9c7e50bda034b89f8aeb30631bd924418f2ba4b66373e89eb2c1d016b12103

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
Build/InstallDev:=:

$(eval $(call BuildPackage,udevrs-$(PKG_VERSION)))
