# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (spider)

include $(TOPDIR)/rules.mk

PKG_NAME:=rmcp
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://static.crates.io/crates/$(PKG_NAME)
PKG_HASH:=0810a9f717d9828f475fe1f629f4c305c8464b7f496c3a854b58d29e65f4058e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/rmcp-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust SDK for Model Context Protocol
  URL:=https://crates.io/crates/rmcp
  BUILDONLY:=1
endef

define Package/rmcp-$(PKG_VERSION)/description
  Rust SDK for Model Context Protocol.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rmcp-$(PKG_VERSION)))
