# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=grex
PKG_VERSION:=1.4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pemistahl/grex/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=9e1c56f3071a75629da4393c5fc736f2b822075b4a1219366b16a039c92f13d2

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
