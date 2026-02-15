# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

# XXX mips(el) (qtun)

include $(TOPDIR)/rules.mk

PKG_NAME:=fastbloom
PKG_VERSION:=0.14.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2025-07-30
PKG_SOURCE_VERSION:=e28261dacfb5862544e5649b43ef7a2db6a9fe98
PKG_SOURCE_URL:=https://github.com/tomtomwombat/fastbloom/
PKG_MIRROR_HASH:=23558fcbaf24570de7ef6421e0b7128acd53b5d42368130918d3a5ffe4c27faa

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-033

define Package/fastbloom-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=The fastest Bloom filter in Rust
  URL:=https://github.com/tomtomwombat/fastbloom/
  BUILDONLY:=1
endef

define Package/fastbloom-$(PKG_VERSION)/description
  The fastest Bloom filter in Rust. No accuracy compromises. Full
 concurrency support and compatible with any hasher.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,fastbloom-$(PKG_VERSION)))
