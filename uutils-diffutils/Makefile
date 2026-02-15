# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=diffutils
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/diffutils/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4c05d236ebddef7738446980a59cd13521b6990ea02242db6b32321dd93853ca

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-031 iana-time-zone-0164

define Package/uutils-diffutils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Drop-in replacement of diffutils in Rust
  URL:=https://github.com/uutils/diffutils
endef

define Package/uutils-diffutils/description
  A CLI app for generating diff files. 
endef

define Package/uutils-diffutils/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/diffutils $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,uutils-diffutils))
