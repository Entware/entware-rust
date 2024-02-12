# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `boringtun` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=boringtun-cli
PKG_VERSION:=0.6.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-24
PKG_SOURCE_VERSION:=f672bb6c1e1e371240a8d151f15854687eb740bb
PKG_SOURCE_URL:=https://github.com/cloudflare/boringtun
PKG_MIRROR_HASH:=57af4c837ff9bb731a9f819a2780eece998e9f640052fc2b0e5910de0562cc42

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175

define Package/boringtun-cli
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Userspace WireGuard Implementation in Rust
  URL:=https://github.com/cloudflare/boringtun
endef

define Package/boringtun-cli/description
  BoringTun is an implementation of the WireGuard® protocol designed
  for portability and speed.
endef

CARGO_ARGS += --workspace

# FIXME
# i386:
#	undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_i386),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/boringtun-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/boringtun-cli $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,boringtun-cli))
