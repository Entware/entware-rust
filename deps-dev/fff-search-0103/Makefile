# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (nushell)

include $(TOPDIR)/rules.mk

PKG_NAME:=fff-search
PKG_VERSION:=0.10.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://static.crates.io/crates/$(PKG_NAME)
PKG_HASH:=cdd36cdc5ffea9e87fb8879d064cbaa529c65421d1de7866d40c7f5ef2597b23

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/fff-search-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Fast file finder core library
  URL:=https://crates.io/crates/fff-search
  BUILDONLY:=1
endef

define Package/fff-search-$(PKG_VERSION)/description
  Fast file finder core library.
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,fff-search-$(PKG_VERSION)))
