# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=grex
PKG_VERSION:=1.4.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pemistahl/grex/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4e849b29b387afc583856f24923b76052ad90e320c2caacfc6452e6d9deb6b14

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/grex
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a command-line tool for generating regular expressions
  URL:=https://github.com/pemistahl/grex
endef

define Package/grex/description
  A command-line tool and Rust library with Python bindings for
  generating regular expressions from user-provided test cases.
endef

define Package/grex/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/grex $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,grex))
