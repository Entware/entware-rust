# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=jql
PKG_VERSION:=8.0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/yamafaktory/jql/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=8af2f6c794cffeba9bc2604cf68cd7ddaa6126ec038786060b463474e8a88b5b

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENCE-APACHE LICENCE-MIT
PKG_MAINTAINER:=Entware team, https://entware.net

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/jql
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a JSON Query Language CLI tool
  URL:=https://github.com/yamafaktory/jql
endef

define Package/jql/description
  jql - JSON Query Language - is a fast and simple command-line tool
  to manipulate JSON data.
endef

define Package/jql/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/jql $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,jql))
