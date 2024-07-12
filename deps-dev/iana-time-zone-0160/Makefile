# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=iana-time-zone
PKG_VERSION:=0.1.60
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/strawlab/iana-time-zone/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=5092f9779ee77c8374f94768a905652ceeb8c4e81c3f5399ac1f97c7993dbe3e

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/iana-time-zone-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=get the IANA time zone for the current system
  URL:=https://github.com/strawlab/iana-time-zone
  BUILDONLY:=1
endef

define Package/iana-time-zone-$(PKG_VERSION)/description
  iana-time-zone - get the IANA time zone for the current system.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,iana-time-zone-$(PKG_VERSION)))
