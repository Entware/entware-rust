# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX armv5/mips(el) (arti)

include $(TOPDIR)/rules.mk

PKG_NAME:=coarsetime
PKG_VERSION:=0.1.29
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jedisct1/rust-coarsetime/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=5dbea92fbf19fd65be1c91e731638d01361835aa4dd595761a36a907e41931c4

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/coarsetime-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Time and duration crate optimized for speed
  URL:=https://github.com/jedisct1/rust-coarsetime
  BUILDONLY:=1
endef

define Package/coarsetime-$(PKG_VERSION)/description
  A Rust crate to make time measurements, that focuses on speed.
endef

# FIXME b1-b1-b1 )))
ifeq ($(or $(CONFIG_TARGET_armv5_3_2),$(CONFIG_TARGET_mips_3_4),$(CONFIG_TARGET_mipsel_3_4)),y)
  define Build/Prepare
	$(Build/Prepare/Default)
	patch -p1 -d $(PKG_BUILD_DIR) < ./patches-32bit/010-fix.patch || true
  endef
endif

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,coarsetime-$(PKG_VERSION)))
