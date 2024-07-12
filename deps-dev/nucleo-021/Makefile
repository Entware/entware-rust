# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (helix)

include $(TOPDIR)/rules.mk

PKG_NAME:=nucleo
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/helix-editor/nucleo/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=fecd5d5ef61a6597e3e0869827b0d52b09716f8e57115a6eab8a2ce4e8d9d7a0

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/nucleo-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=A fast and convenient fuzzy matcher library for rust
  URL:=https://github.com/helix-editor/nucleo
  BUILDONLY:=1
endef

define Package/nucleo-$(PKG_VERSION)/description
  A fast and convenient fuzzy matcher library for rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,nucleo-$(PKG_VERSION)))
