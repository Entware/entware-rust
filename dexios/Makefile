# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dexios
PKG_VERSION:=8.8.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/brxken128/dexios/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2f6a69070d2114c6e32479dac78b5872fd6406e6b8d8c6d28a5fa54d1bedbab1

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/dexios
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Encryption
  TITLE:=A secure file encryption utility
  URL:=https://github.com/brxken128/dexios
endef

define Package/dexios/description
  A library for encrypting/decrypting, password hashing, and for
  managing encrypted file headers that adhere to the Dexios format.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/dexios/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dexios $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dexios))
