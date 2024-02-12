# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustls
PKG_VERSION:=0.22.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/rustls/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=53e9af17818b8b9c8debfc01c06e9b1b3f8c2118dde7a2a24cc854794598825e

PKG_LICENSE:=Apache-2.0 ISC MIT
PKG_LICENSE_FILES:=LICENSE LICENSE-APACHE LICENSE-ISC LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rcgen-0113 ring-0177 rustls-webpki-01021 webpki-roots-0260
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustls-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A modern TLS library in Rust
  URL:=https://github.com/rustls/rustls
  BUILDONLY:=1
endef

define Package/rustls-$(PKG_VERSION)/description
  Rustls is a modern TLS library written in Rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rustls-$(PKG_VERSION)))
