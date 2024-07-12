# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (atuin)

include $(TOPDIR)/rules.mk

PKG_NAME:=sqlx
PKG_VERSION:=0.7.3
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/launchbadge/sqlx/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9f72c8099bbe35fc541d5a66fad59d751f35ef3efb4a510b273243b65118cdd4

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

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
