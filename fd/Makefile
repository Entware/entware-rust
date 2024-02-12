# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=fd
PKG_VERSION:=9.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/fd/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=306d7662994e06e23d25587246fa3fb1f528579e42a84f5128e75feec635a370

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/fd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a simple, fast and user-friendly alternative to find
  URL:=https://github.com/sharkdp/fd
endef

define Package/fd/description
  fd is a program to find entries in your filesystem.
  It is a simple, fast and user-friendly alternative to 'find'.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/fd/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/fd $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,fd))
