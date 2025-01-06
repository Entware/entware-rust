# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=eza
PKG_VERSION:=0.20.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/eza-community/eza/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=37e8bec3b2f7745f61d83d73ff0cb9a327180dd54f187c18c2d58aeb08d4da99

PKG_LICENSE:=EUPL-1.2
PKG_LICENSE_FILES:=LICENSE.txt
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/eza
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a modern replacement for ls
  URL:=https://eza.rocks
  DEPENDS:=+zlib
endef

define Package/eza/description
  eza is a modern, maintained replacement for ls, built on exa.
endef

define Package/eza/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/eza $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,eza))
