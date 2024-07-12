# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (nu-plugin-file)

include $(TOPDIR)/rules.mk

PKG_NAME:=specta
PKG_VERSION:=1.0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/oscartbeaumont/specta/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f821386b53f8046f458c0cf6927c88ab42bbe67bd6b68a0e30dc355496695cd0

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/specta-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Easily export your Rust types to other languages
  URL:=https://github.com/oscartbeaumont/specta
  BUILDONLY:=1
endef

define Package/specta-$(PKG_VERSION)/description
  Easily export your Rust types to other languages.
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

$(eval $(call BuildPackage,specta-$(PKG_VERSION)))
