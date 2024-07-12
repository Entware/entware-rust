# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bingrep
PKG_VERSION:=0.11.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/m4b/bingrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3012aef73b3ef5e8b100824af0db2131f81771338fec5f9fe47dc71bf3782506

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/bingrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Cross-platform binary parser and colorizer
  URL:=https://github.com/m4b/bingrep
endef

define Package/bingrep/description
  Greps through binaries from various OSs and architectures, and colors them.
endef

define Package/bingrep/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bingrep $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bingrep))
