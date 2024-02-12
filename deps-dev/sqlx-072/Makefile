# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX armv5/mips(el) (rustdesk-server)

include $(TOPDIR)/rules.mk

PKG_NAME:=sqlx
PKG_VERSION:=0.7.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-09-27
PKG_SOURCE_VERSION:=e80291b2a771bf66e9c03f068fd196c7a47c1967
PKG_SOURCE_URL:=https://github.com/launchbadge/sqlx
PKG_MIRROR_HASH:=7acf22a039fbb2023b99b0b12157061c0df6ffbd276d711647c00e81b55f2921

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 rustls-0219 webpki-roots-0243

define Package/sqlx-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=The Rust SQL Toolkit
  URL:=https://github.com/launchbadge/sqlx
  BUILDONLY:=1
endef

define Package/sqlx-$(PKG_VERSION)/description
  The Rust SQL Toolkit.
  An async, pure Rust SQL crate featuring compile-time checked
  queries without a DSL. Supports PostgreSQL, MySQL, and SQLite.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,sqlx-$(PKG_VERSION)))
