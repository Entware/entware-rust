# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=qsc
PKG_VERSION:=0.4.2
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/0xor0ne/qscan/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=cd7703e5b718be5a1b9268e0807cff9c7fc87e3952bd550d4af34a4de6da2658

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += trust-dns
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/qsc
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Quick async network scanner CLI
  URL:=https://github.com/0xor0ne/qscan
endef

define Package/qsc/description
  Rust command line utility for quick asynchronous network hosts
  scanning.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/qsc/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/qsc $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,qsc))
