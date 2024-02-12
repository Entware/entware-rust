# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (atuin(ring-0.16.x))

include $(TOPDIR)/rules.mk

PKG_NAME:=rusty-paserk
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-11-07
PKG_SOURCE_VERSION:=9b033086824821e91c41793cfe2149d3bb8a465a
PKG_SOURCE_URL:=https://github.com/conradludgate/rusty-paserk
PKG_MIRROR_HASH:=9fcd3cbf1985ca0e6d772b6522b479fd1d6d2923f01c0c6a27af462363404d72

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rusty-paseto-060

define Package/rusty-paserk-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=PASERK implementation in Rust
  URL:=https://github.com/conradludgate/rusty-paserk
  BUILDONLY:=1
endef

define Package/rusty-paserk-$(PKG_VERSION)/description
  Platform Agnostic Serializable Keys (PASERK)
  is an extension on PASETO for key management.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rusty-paserk-$(PKG_VERSION)))
