# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=ring
PKG_VERSION:=0.17.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-16
PKG_SOURCE_VERSION:=057de0ff98a467499c3c0a1779764d647841a07e
PKG_SOURCE_URL:=https://github.com/briansmith/ring
PKG_MIRROR_HASH:=040e8ee1439b1da0cef249a3c8cc0f69944d1168c2f38ac7e140124021826b6f

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
