# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rcgen
PKG_VERSION:=0.11.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/rcgen/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=df7215560bc82b1b9a795f780c457d3ec7a1bf060faae7bc841132ded21d99c4

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175 rustls-webpki-01017

define Package/rcgen-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust X.509 certificate generator
  URL:=https://github.com/rustls/rcgen
  BUILDONLY:=1
endef

define Package/rcgen-$(PKG_VERSION)/description
  Generate X.509 certificates.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rcgen-$(PKG_VERSION)))
