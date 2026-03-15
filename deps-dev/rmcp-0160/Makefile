# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (nushell)

include $(TOPDIR)/rules.mk

PKG_NAME:=rmcp
PKG_VERSION:=0.16.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/modelcontextprotocol/rust-sdk/tar.gz/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=471d1097d7bdd419b4288abf42e35ed627fba0847d7bc30555c09e92ee9fce0e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 getrandom-042 iana-time-zone-0164
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rmcp-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust SDK for Model Context Protocol
  URL:=https://github.com/modelcontextprotocol/rust-sdk
  BUILDONLY:=1
endef

define Package/rmcp-$(PKG_VERSION)/description
  Rust SDK for Model Context Protocol.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rmcp-$(PKG_VERSION)))
