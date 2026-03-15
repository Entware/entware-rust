# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# all (localtime/TZ)

include $(TOPDIR)/rules.mk

PKG_NAME:=iana-time-zone
PKG_VERSION:=0.1.65
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/strawlab/iana-time-zone/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=152566cbc969b4204e0b488c1eb42851dd159231d0f7c0caf5742d58a799f754

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0443 getrandom-0217

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
