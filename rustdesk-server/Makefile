# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `async-speed-limit` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=rustdesk-server
PKG_VERSION:=1.1.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustdesk/rustdesk-server/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=48c85d9032043d644cee12ccbf4025ea4dc2f4c271fb3f73d836d8e1c67083a0

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += async-speed-limit-031-1 chrono-0431 getrandom-0215
PKG_BUILD_DEPENDS += jsonwebtoken-910 quinn-0104 sqlx-072

define Package/rustdesk-server
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=RustDesk Server Program
  URL:=https://rustdesk.com/server
endef

define Package/rustdesk-server/description
  RustDesk Server Program.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/rustdesk-server/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hbb{r,s} $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rustdesk-utils $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rustdesk-server))
