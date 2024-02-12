# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=tokio-rustls
PKG_VERSION:=0.24.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-06-09
PKG_SOURCE_VERSION:=15020d31e50ada3995f0842434f60dc9243a9c76
PKG_SOURCE_URL:=https://github.com/rustls/tokio-rustls
PKG_MIRROR_HASH:=fb41c1ac7a5cbac0e04f4185cfe663bcbd48f794ddf98cf620532dcdb63add68

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rustls-0219 rustls-webpki-01017 webpki-roots-0243

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
