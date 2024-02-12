# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=webpki-roots
PKG_VERSION:=0.25.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/webpki-roots/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=ddfd880e20a75f68e88a704850c524a0aa4705dced796ddb2e3b27452126f721

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 rcgen-0113 ring-0175 rustls-webpki-01017
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
