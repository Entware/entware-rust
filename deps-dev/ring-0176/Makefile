# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=ring
PKG_VERSION:=0.17.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-11-29
PKG_SOURCE_VERSION:=464d367252354418a2c17feb806876d4d89a8508
PKG_SOURCE_URL:=https://github.com/briansmith/ring
PKG_MIRROR_HASH:=2dfe5d6e9ce1da2918f8c132f2988f9c932e054f9e1886cc884478469e5f873d

PKG_LICENSE:=non-standard
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/ring-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Safe, fast, small crypto using Rust
  URL:=https://github.com/briansmith/ring
  BUILDONLY:=1
endef

define Package/ring-$(PKG_VERSION)/description
  Safe, fast, small crypto using Rust with BoringSSL's cryptography primitives.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,ring-$(PKG_VERSION)))
