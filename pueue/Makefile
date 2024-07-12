# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=pueue
PKG_VERSION:=3.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Nukesor/pueue/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=868710de128db49e0a0c4ddee127dfc0e19b20cbdfd4a9d53d5ed792c5538244

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

define Package/pueue
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=CLI task manager for long-running tasks
  URL:=https://github.com/Nukesor/pueue
endef

define Package/pueue/description
  Pueue is a command-line task management tool for sequential and
  parallel execution of long-running tasks.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/pueue/install
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S11pueued $(1)/opt/etc/init.d
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/pueue{,d} $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,pueue))
