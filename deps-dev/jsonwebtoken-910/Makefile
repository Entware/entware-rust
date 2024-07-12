# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (rustdesk-server)

include $(TOPDIR)/rules.mk

PKG_NAME:=jsonwebtoken
PKG_VERSION:=9.1.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Keats/jsonwebtoken/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=fac3d8849eba6b7c6fdb6fa99f476c5007433706415749f3895d15c11a0d0656

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/jsonwebtoken-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Async-friendly QUIC implementation in Rust
  URL:=https://github.com/Keats/jsonwebtoken
  BUILDONLY:=1
endef

define Package/jsonwebtoken-$(PKG_VERSION)/description
  Create and decode JWTs in a strongly typed way.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,jsonwebtoken-$(PKG_VERSION)))
