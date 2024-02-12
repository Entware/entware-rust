# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (atuin(ring-0.16.x))

include $(TOPDIR)/rules.mk

PKG_NAME:=rusty-paseto
PKG_VERSION:=0.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rrrodzilla/rusty_paseto/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=cab7784da8b92f181f760efd3ae9f568407574b31ce0b68f434aadbea4facf04

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rusty-paseto-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A type-driven for Platform-Agnostic Security Tokens
  URL:=https://github.com/rrrodzilla/rusty_paseto
  BUILDONLY:=1
endef

define Package/rusty-paseto-$(PKG_VERSION)/description
  A type-driven, ergonomic alternative to JWT
  for secure stateless PASETO tokens.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rusty-paseto-$(PKG_VERSION)))
