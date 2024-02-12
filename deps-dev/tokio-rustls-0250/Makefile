# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=tokio-rustls
PKG_VERSION:=0.25.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-12-05
PKG_SOURCE_VERSION:=ff32e1ec589e3a81425d0721f9595e786231683d
PKG_SOURCE_URL:=https://github.com/rustls/tokio-rustls
PKG_MIRROR_HASH:=7e12358059baafe0c5fc87bbbda022e0bf8126e1bbd52a33a7d8ce146c2413b9

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0177 rustls-0221 webpki-roots-0260

define Package/tokio-rustls-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Asynchronous TLS/SSL streams for Tokio using Rustls
  URL:=https://github.com/rustls/tokio-rustls
  BUILDONLY:=1
endef

define Package/tokio-rustls-$(PKG_VERSION)/description
  Async TLS for the Tokio runtime.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,tokio-rustls-$(PKG_VERSION)))
