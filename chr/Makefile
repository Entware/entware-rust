# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# Abandoned in 2021

include $(TOPDIR)/rules.mk

PKG_NAME:=chr
PKG_VERSION:=1.0.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/pemistahl/chr/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a9aaaddeefd92ddff55dbe8123bd40082615a2ae0d5fe0968adefad9f99fe0d5

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0216 getrandom-034

define Package/chr
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A command-line tool that gives information about Unicode characters
  URL:=https://github.com/pemistahl/chr
endef

define Package/chr/description
  chr is a command-line utility that is meant to give
  various information about Unicode characters.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(HOST_TAR) x -Jf files/chr.db-17.0.0.tar.xz -C $(PKG_BUILD_DIR) 
endef

define Package/chr/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/chr $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,chr))
