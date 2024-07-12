# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=tokei
PKG_VERSION:=13.0.0-alpha.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/XAMPPRocky/tokei/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=637c6e3d905089f74cf8195666304ac98273cee609541c8a2d87ba438ba08c6e

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/tokei
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=count your code, quickly
  URL:=https://tokei.rs
endef

define Package/tokei/description
  Tokei is a program that displays statistics about your code.
  Tokei will show the number of files, total lines within those
  files and code, comments, and blanks grouped by language.
endef

define Package/tokei/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/tokei $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,tokei))
