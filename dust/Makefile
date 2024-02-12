# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX since 0.8.4:
# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `du-dust` due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=dust
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/bootandy/dust/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=70efd66e662fcd93bbc6cf2f8c3104a1de7e52090f709e9040a34bdc7c72ea9c

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

RUST_MIN_SIZE:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/dust
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=A more intuitive version of du
  URL:=https://crates.io/crates/du-dust
endef

define Package/dust/description
  du + rust = dust. Like du but more intuitive.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/dust/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dust $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dust))
