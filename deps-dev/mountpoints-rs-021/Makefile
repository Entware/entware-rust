# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX arm/mips(el) (spacedisplay-rs)

include $(TOPDIR)/rules.mk

PKG_NAME:=mountpoints-rs
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Speedy37/mountpoints-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=ee640c7629a5678ac92526fc17d701efb86f91a672bcae5a5fa113a183561871

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/mountpoints-rs-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=List mount points (windows, linux, macos)
  URL:=https://github.com/Speedy37/mountpoints-rs
  BUILDONLY:=1
endef

define Package/mountpoints-rs-$(PKG_VERSION)/description
  mountpoints - List mount points (windows, linux, macos).
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch
  endef
endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,mountpoints-rs-$(PKG_VERSION)))
