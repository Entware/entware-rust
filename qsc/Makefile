# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# Abandoned in 2022

include $(TOPDIR)/rules.mk

PKG_NAME:=qsc
PKG_REAL_VERSION:=0.4.3
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-12-26
PKG_SOURCE_VERSION:=dd3e8bd0421d05ab43a01b823d3d0a96c6b1ad3e
PKG_SOURCE_URL:=https://github.com/0xor0ne/qscan
PKG_MIRROR_HASH:=d4fc8dee4ed876c8e8fc4a99abe80e416fdba64bfab7f983615b15811910bff0

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0215 trust-dns
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
