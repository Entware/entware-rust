# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=chrono
PKG_VERSION:=0.4.33
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/chronotope/chrono/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1ea602034f911317b396c6dafebf32a102dc251244e079b54e9e0530e7ba42dd

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += iana-time-zone-0159

define Package/chrono-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Date and time library for Rust
  URL:=https://github.com/chronotope/chrono
  BUILDONLY:=1
endef

define Package/chrono-$(PKG_VERSION)/description
  Timezone-aware date and time handling.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,chrono-$(PKG_VERSION)))
