# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=pueue
PKG_VERSION:=4.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Nukesor/pueue/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=059ee9688cb8b1ce46284f5ad58de21911b6af50098d29598085d2b9dbd432ab

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164

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
