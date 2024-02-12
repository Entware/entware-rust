# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el <= v0.17)

include $(TOPDIR)/rules.mk

PKG_NAME:=ring
PKG_VERSION:=0.17.7
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-12-06
PKG_SOURCE_VERSION:=2be687bebdf76648ce85109d40c015412e14b0da
PKG_SOURCE_URL:=https://github.com/briansmith/ring
PKG_MIRROR_HASH:=b65907e6083dc4b670b41a6b0b9a1f5f1758c940a421a4c5a6777f4c88c9dc7d

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
