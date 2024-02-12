# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zenith
PKG_VERSION:=0.14.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bvaisvil/zenith/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=2cbcea2625cfa97c161b974ad412a47e330f7fd31bec0479e329ed3606cfc569

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 raw-cpuid-911

define Package/zenith
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=sort of like top or htop
  URL:=https://github.com/bvaisvil/zenith
endef

define Package/zenith/description
  In terminal graphical metrics for your *nix system written in Rust.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/zenith/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zenith $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zenith))
