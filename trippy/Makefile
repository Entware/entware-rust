# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el)/armv5:
#	error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
#	error: could not compile `tracing-chrome` (lib) due to previous error

include $(TOPDIR)/rules.mk

PKG_NAME:=trippy
PKG_VERSION:=0.9.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fujiapple852/trippy/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=bebd130c74ceacf4bc6b6f3aa92fa639e1904eb904c5135f53c45510370289ed

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 tracing-chrome-071

define Package/trippy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A network diagnostic tool
  URL:=https://github.com/fujiapple852/trippy
endef

define Package/trippy/description
  A network diagnostic tool, inspired by mtr.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/trippy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/trip $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,trippy))
