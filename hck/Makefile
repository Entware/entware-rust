# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hck
PKG_VERSION:=0.11.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sstadick/hck/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b9821c4de35308d8d1d9e979da39f8a7effd82d2e0b1f4f7b1c83bc48ab8da20

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE-MIT UNLICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0217 getrandom-042

define Package/hck
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a sharp cut(1) clone
  URL:=https://github.com/sstadick/hck
endef

define Package/hck/description
  hck is a shortening of hack, a rougher form of cut.
endef

ifeq ($(CONFIG_arm),y)
TARGET_CFLAGS += -mfloat-abi=softfp
endif

define Package/hck/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hck $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,hck))
