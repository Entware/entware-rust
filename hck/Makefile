# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hck
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sstadick/hck/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6a90bc7e7f93489149262f5551efb611cd874e938ba7d459a2c4254031301317

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE-MIT UNLICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

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
