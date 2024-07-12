# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=lsd
PKG_VERSION:=1.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/lsd-rs/lsd/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=cd80dae9a8f6c4c2061f79084468ea6e04c372e932e3712a165119417960e14e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

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
