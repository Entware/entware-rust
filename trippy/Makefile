# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=trippy
PKG_VERSION:=0.12.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fujiapple852/trippy/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=ae868123cba03977786f0dd74297f2e15e021d753684bd6e47554003f03a3d5b

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/trippy
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A network diagnostic tool
  URL:=https://github.com/fujiapple852/trippy
endef

define Package/trippy/description
  A network diagnostic tool, inspired by mtr.
endef

define Package/trippy/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/trip $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,trippy))
