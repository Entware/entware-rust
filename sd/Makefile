# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sd
PKG_VERSION:=1.0.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/chmln/sd/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=2adc1dec0d2c63cbffa94204b212926f2735a59753494fca72c3cfe4001d472f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0215

define Package/sd
  SECTION:=utils
  CATEGORY:=Utilities
#  SUBMENU:=Editors
  TITLE:=an intuitive find & replace CLI
  URL:=https://github.com/chmln/sd
endef

define Package/sd/description
  sd - s[earch] & d[isplace] is an intuitive find & replace CLI.
  (sed alternative)
endef

define Package/sd/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sd $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,sd))
