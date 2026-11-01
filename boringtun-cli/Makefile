# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=boringtun-cli
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cloudflare/boringtun/tar.gz/$(PKG_NAME)-$(PKG_VERSION)?
PKG_HASH:=0bfce9717e898533036c853e3433308770d9cd0a5f54b10e9d90f149947e355c

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0217
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/boringtun-cli
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Userspace WireGuard Implementation in Rust
  URL:=https://github.com/cloudflare/boringtun
  DEPENDS:=@!(mips||mipsel)
endef

define Package/boringtun-cli/description
  BoringTun is an implementation of the WireGuard® protocol designed
  for portability and speed.
endef

CARGO_ARGS += --workspace

ifneq ($(CONFIG_ARCH_64BIT),y)
PKG_RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/boringtun-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/boringtun-cli $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,boringtun-cli))
