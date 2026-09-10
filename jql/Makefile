# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=jql
PKG_VERSION:=9.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/yamafaktory/jql/tar.gz/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=7930ec76dc9df19d49feebf8d6609e13e77094b17ec158c32a9efa7c148f805f

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
  DEPENDS:=+libatomic
endef

define Package/jql/description
  jql - JSON Query Language - is a fast and simple command-line tool
  to manipulate JSON data.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += -l dylib=atomic
endif

define Package/jql/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/jql $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,jql))
