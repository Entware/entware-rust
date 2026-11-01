# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/findutils/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=e36ae3937f889bc59cfbd65820a642baa695c58d7fa1e387e41857e710f40419

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 getrandom-0217 getrandom-042 iana-time-zone-0164

define Package/findutils-rs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Rust implementation of GNU findutils
  URL:=https://github.com/uutils/findutils
endef

define Package/findutils-rs/description
  Rust implementation of GNU findutils.
endef

define Package/findutils-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/{find,xargs} $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,findutils-rs))
