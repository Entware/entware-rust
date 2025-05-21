# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

# XXX mips(el) (hex-patch)

include $(TOPDIR)/rules.mk

PKG_NAME:=flurry
PKG_VERSION:=0.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jonhoo/flurry/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9bbfa1bac82c51ff061f4d4967f8e407af5b253eafa8eba2b1f8fe55bea7945d

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += seize-033

define Package/flurry-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust port of Java's ConcurrentHashMap
  URL:=https://github.com/jonhoo/flurry
  BUILDONLY:=1
endef

define Package/flurry-$(PKG_VERSION)/description
  A port of Java's ConcurrentHashMap to Rust.
endef

ifeq ($(or $(CONFIG_mips),$(CONFIG_mipsel)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,flurry-$(PKG_VERSION)))
