# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=lsd
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/lsd-rs/lsd/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=dae8d43087686a4a1de0584922608e9cbab00727d0f72e4aa487860a9cbfeefa

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0437 getrandom-0215 iana-time-zone-0160

define Package/lsd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=the next gen ls command
  URL:=https://github.com/lsd-rs/lsd
  DEPENDS:=+zlib
endef

define Package/lsd/description
  LSD (LSDeluxe)
  An ls command with a lot of pretty colors and some other stuff.
endef

define Package/lsd/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/lsd $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,lsd))
