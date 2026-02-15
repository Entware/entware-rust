# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

# mips{,el} (ugdb)

include $(TOPDIR)/rules.mk

PKG_NAME:=raw-tty
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=0f2116094ac6b7a00cb4361134696f704b3ce33d
PKG_SOURCE_URL:=https://github.com/norcalli/raw_tty.rs
PKG_MIRROR_HASH:=bdb8105357665081e01aa997474bc05daef45702530fc831afc46359cff9ad5b

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/raw-tty-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust crate for modifying tty modes, esp. raw tty mode
  URL:=https://github.com/norcalli/raw_tty.rs
  BUILDONLY:=1
endef

define Package/raw-tty-$(PKG_VERSION)/description
  This crate can be used for generally interacting with a tty's mode
 safely, but was created originally to solve the problem of using raw mode with
 /dev/tty while reading stdin for data.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,raw-tty-$(PKG_VERSION)))
