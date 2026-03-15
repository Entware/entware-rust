# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=chrono
PKG_VERSION:=0.4.44
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/chronotope/chrono/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=0bb0032a0a1aeb7623f33b74dab900c63434c52a281fe31ef9a2223215fa70c5

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0217 iana-time-zone-0164

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
Build/InstallDev:=:

$(eval $(call BuildPackage,chrono-$(PKG_VERSION)))
