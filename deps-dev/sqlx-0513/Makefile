# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (gobang)

include $(TOPDIR)/rules.mk

PKG_NAME:=sqlx
PKG_VERSION:=0.5.13
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-04-15
PKG_SOURCE_VERSION:=6be16b4d1b55b20985b8b762956ab443f9481c3d
PKG_SOURCE_URL:=https://github.com/launchbadge/sqlx
PKG_MIRROR_HASH:=63b12d20157e5743b169b679a9f399309fd3279224c4aae2dce361d18a7988ee

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

# XXX uncomment for testing
#CARGO_ARGS += --features runtime-actix-native-tls

#ifneq ($(CONFIG_ARCH_64BIT),y)
#RUSTFLAGS += --cfg crossbeam_no_atomic_64
#endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,sqlx-$(PKG_VERSION)))
