# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX (newsboat)
# Abandoned in 2021

include $(TOPDIR)/rules.mk

PKG_NAME:=stfl
PKG_VERSION:=0.24
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-11-29
PKG_SOURCE_VERSION:=c2c10b8a50fef613c0aacdc5d06a0fa610bf79e9
PKG_SOURCE_URL:=https://github.com/newsboat/stfl
PKG_MIRROR_HASH:=84ac50b9cf444cc47ad5e0a99aaa496ecc8c3222bda54d0663a639a6801047e3

PKG_VERSION:=$(PKG_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=LGPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libstfl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=The Structured Terminal Forms Language/Library
  URL:=https://github.com/newsboat/stfl
  DEPENDS:=+libncursesw
endef

define Package/libstfl/description
  STFL is a library which implements a curses-based widget set for
  text terminals.
endef

Build/Configure:=:

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/stfl.h $(1)/opt/include
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libstfl.{a,so*} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/stfl.pc $(1)/opt/lib/pkgconfig
endef

define Package/libstfl/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libstfl.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libstfl))
