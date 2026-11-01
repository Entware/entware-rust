# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# https://github.com/Entware/Entware/issues/1045

include $(TOPDIR)/rules.mk

PKG_NAME:=vopono
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jamesmcm/vopono/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=e6560d8845e734f2252df1f4a774921e4dde55cccb852dd4bba6e37f032a036d

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0445 getrandom-0217 getrandom-043 iana-time-zone-0164

define Package/vopono
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=Run applications through VPN tunnels
  URL:=https://github.com/jamesmcm/vopono
  DEPENDS:=+liblzma
endef

define Package/vopono/description
  Launch applications via VPN tunnels using temporary network namespaces.
endef

define Package/vopono/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/vopono $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,vopono))
