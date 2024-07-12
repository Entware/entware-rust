# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dua-cli
PKG_VERSION:=2.29.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Byron/dua-cli/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=af58bfc5146b296ced1ed711b0bbd21bce731a69fb6bea6622e6acfbe180a91a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

define Package/dua-cli
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Disc
  TITLE:=Disk Usage Analyzer
  URL:=https://github.com/Byron/dua-cli
endef

define Package/dua-cli/description
  dua (-> Disk Usage Analyzer) is a tool to conveniently learn
  about the usage of disk space of a given directory.
endef

define Package/dua-cli/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dua $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dua-cli))
