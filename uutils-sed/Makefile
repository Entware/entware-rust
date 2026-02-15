# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sed
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/sed/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=48356c208190ceb4e8bd98ffa98d4597111b000e471e4c8c284b0939f4bac3c1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164 \
	uutils-coreutils

define Package/uutils-sed
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=Rewrite of sed in Rust
  URL:=https://github.com/uutils/sed
endef

define Package/uutils-sed/description
 sed ~ implemented as universal (cross-platform) utils, written in Rust.
endef

define Package/uutils-sed/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sed $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,uutils-sed))
