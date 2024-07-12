# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (hickory-dns, leaf, nu-plugin-dns, rustdesk-server, qtun)

include $(TOPDIR)/rules.mk

PKG_NAME:=quinn
PKG_VERSION:=0.10.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/quinn-rs/quinn/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=988d90c6e9d99da94cde7ab3ccfd831b11107c4b6efd96a24f87e7229147ecf8

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/quinn-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Async-friendly QUIC implementation in Rust
  URL:=https://github.com/quinn-rs/quinn
  BUILDONLY:=1
endef

define Package/quinn-$(PKG_VERSION)/description
  Quinn is a pure-rust, async-compatible implementation
  of the IETF QUIC transport protocol.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,quinn-$(PKG_VERSION)))
