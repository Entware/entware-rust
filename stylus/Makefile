# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=stylus
PKG_VERSION:=0.10.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mmastrac/stylus/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=cb08fad1023ff5aa534346e2e7bd1884f0f23c76b05b71bb72485878f571687e

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/stylus
  SECTION:=net
  CATEGORY:=Network
  TITLE:=a lightweight status page for home infrastructure
  URL:=https://github.com/mmastrac/stylus
endef

define Package/stylus/description
  Stylus (style + status) is a lightweight status page for home infrastructure.
endef

define Package/stylus/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/stylus $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_BUILD_DIR)/examples $(1)/opt/share/stylus
	$(FIND) $(1)/opt/share/stylus -type f | $(XARGS) $(SED) \
		's,^#!.*sh,#!/opt/bin/bash,'
endef

define Package/stylus/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\n$$ansi_white %s $$ansi_blue %s $$ansi_std\n\n" "Read:" "https://github.com/mmastrac/stylus/wiki"
endef

$(eval $(call BuildPackage,stylus))
