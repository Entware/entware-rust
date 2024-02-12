# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustls-webpki
PKG_VERSION:=0.101.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/webpki/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=fd2f9c4d3576d5e907db9a2332f45bc371091cdcf21932cc48a171a84fea693e

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

# Circular rcgen <-> rustls-webpki dependency
PKG_BUILD_DEPENDS += ring-0175
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustls-webpki-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Web PKI X.509 Certificate Verification
  URL:=https://github.com/rustls/webpki
  BUILDONLY:=1
endef

define Package/rustls-webpki-$(PKG_VERSION)/description
  WebPKI X.509 Certificate Validation in Rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rustls-webpki-$(PKG_VERSION)))
