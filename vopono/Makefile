# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# https://github.com/Entware/Entware/issues/1045

include $(TOPDIR)/rules.mk

PKG_NAME:=vopono
PKG_VERSION:=0.10.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jamesmcm/vopono/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=9394a3b1c68cacac09c6d9e9ae71fca9c9229a5bf381ccb0b5e408aeb77b5ff9

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0442 getrandom-0216 getrandom-034 iana-time-zone-0164

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
