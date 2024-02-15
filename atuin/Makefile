# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`
# armv5/mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `sqlx-core` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=atuin
PKG_VERSION:=18.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ellie/atuin/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f9e4af24a78678d9d4283912561977aae7caf10b8dbcb3a468a09efa2ffcc1a3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += reqwest-01121 ring-0175 rusty-paserk-030 rusty-paseto-060 sqlx-073

define Package/atuin
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=magical shell history
  URL:=https://atuin.sh
endef

define Package/atuin/description
  Magical shell history.
endef

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/atuin/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/atuin $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,atuin))
