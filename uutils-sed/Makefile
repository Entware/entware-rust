# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sed
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/sed/tar.gz/$(PKG_VERSION)?
PKG_HASH:=a5a03b3871b963420d1408b11415c90d4d69df02ab4f2f82826b42899a61a87a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0445 getrandom-042 iana-time-zone-0164 \
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
