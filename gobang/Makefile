# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=gobang
PKG_REAL_VERSION:=0.1.0-alpha.5
PKG_VERSION:=$(subst -alpha.,_alpha,$(PKG_REAL_VERSION))
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REAL_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/TaKO8Ki/gobang/tar.gz/refs/tags/v$(PKG_REAL_VERSION)?
PKG_HASH:=923210d500f070ac862c73d1a43a10520ee8c54f6692bbce99bbd073dfa72653

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 sqlx-0513
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/gobang
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Database
  TITLE:=A cross-platform TUI database management tool
  URL:=https://github.com/TaKO8Ki/gobang
  DEPENDS:=+libopenssl
endef

define Package/gobang/description
  A cross-platform TUI database management tool written in Rust.
endef

define Package/gobang/conffiles
/opt/etc/gobang/config.toml
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/gobang/install
	$(INSTALL_DIR) $(1)/opt/etc/gobang
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/sample.toml $(1)/opt/etc/gobang/config.toml
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gobang $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gobang))
