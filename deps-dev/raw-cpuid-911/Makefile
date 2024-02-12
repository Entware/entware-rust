# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX i386 (zenith)

include $(TOPDIR)/rules.mk

PKG_NAME:=raw-cpuid
PKG_VERSION:=9.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/gz/rust-cpuid/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=4728d97bb8ea8b32b858be43a34ecfa20375d093240630fb90efc9850ea0a9a7

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/raw-cpuid-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=cpuid library in rust
  URL:=https://github.com/gz/raw-cpuid
  BUILDONLY:=1
endef

define Package/raw-cpuid-$(PKG_VERSION)/description
  A library to parse the x86 CPUID instruction, written
  in rust with no external dependencies. The implementation closely resembles
  the Intel CPUID manual description. The library does only depend on libcore.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,raw-cpuid-$(PKG_VERSION)))
