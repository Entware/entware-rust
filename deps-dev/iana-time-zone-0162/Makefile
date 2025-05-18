# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=iana-time-zone
PKG_VERSION:=0.1.62
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/strawlab/iana-time-zone/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3b334a2950a0b8452a77fcf8bdc80d502352a12c327d9e22096192f18e3ea652

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
