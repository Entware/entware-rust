# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=bandwhich
PKG_VERSION:=0.22.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/imsnif/bandwhich/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=4c41719549e05dbaac1bc84828269e59b2f2032e76ae646da9b9e3b87e5a5fd1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0434

define Package/bandwhich
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Terminal bandwidth utilization tool
  URL:=https://github.com/imsnif/bandwhich
endef

define Package/bandwhich/description
  This is a CLI utility for displaying current network utilization by process,
  connection and remote IP/hostname.
endef

define Package/bandwhich/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bandwhich $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bandwhich))
