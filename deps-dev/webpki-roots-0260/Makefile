# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=webpki-roots
PKG_VERSION:=0.26.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/webpki-roots/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=8eab5ff46710a6c906c29b0b3ebb2b1dc2ba8b80513d8e6f35d77a6d799eecb0

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 rcgen-0113 ring-0177 rustls-webpki-01021
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/webpki-roots-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Mozilla's CA root certificates for use with webpki
  URL:=https://github.com/rustls/webpki-roots
  BUILDONLY:=1
endef

define Package/webpki-roots-$(PKG_VERSION)/description
  CA certificates for use with webpki.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,webpki-roots-$(PKG_VERSION)))
