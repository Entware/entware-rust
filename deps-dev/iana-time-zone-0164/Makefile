# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=iana-time-zone
PKG_VERSION:=0.1.64
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/strawlab/iana-time-zone/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=34829fa102df98178bf39c337b955ef27d5a15ce72cc4ab5b8181e1b835ac2ac

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0216

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
Build/InstallDev:=:

$(eval $(call BuildPackage,iana-time-zone-$(PKG_VERSION)))
