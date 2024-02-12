# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustls-ffi
PKG_VERSION:=0.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/rustls-ffi/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0eeac3b916286cce35a3f32f3fd11f54ad2584a32bb67ac41c0c563c7c62c98b

PKG_LICENSE:=Apache-2.0 ISC MIT
PKG_LICENSE_FILES:=LICENSE LICENSE-APACHE LICENSE-ISC LICENSE-MIT

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rustls-0219 rustls-webpki-01017 sct-rs-071

define Package/rustls-ffi-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Use Rustls from any language
  URL:=https://github.com/rustls/rustls-ffi
  BUILDONLY:=1
endef

define Package/rustls-ffi-$(PKG_VERSION)/description
  Rustls bindings for non-Rust languages.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rustls-ffi-$(PKG_VERSION)))
