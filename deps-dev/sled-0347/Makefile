# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sled
PKG_VERSION:=0.34.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/spacejam/sled/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=dd1c757464b970a4eb73c954b345be63655c84bb1de249af3c3a609c57763046

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/sled-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=the champagne of beta embedded databases
  URL:=https://github.com/spacejam/sled
  BUILDONLY:=1
endef

define Package/sled-$(PKG_VERSION)/description
  Lightweight high-performance pure-rust transactional embedded database.
endef

# FIXME b1-b1-b1 )))
define Build/Prepare
	$(Build/Prepare/Default)
  ifeq ($(CONFIG_TARGET_armv5_3_2),y)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-armv5/010-fix.patch || true
  endif
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,sled-$(PKG_VERSION)))
