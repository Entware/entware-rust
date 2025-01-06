# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ripcalc
PKG_VERSION:=0.1.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.com/edneville/ripcalc/-/archive/v$(PKG_VERSION)
PKG_HASH:=092912e00684c3437fd9193a926c4dc0c702cc55687bd46e33542b8e4319a112

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/ripcalc
  SECTION:=net
  CATEGORY:=Network
  TITLE:=format and lookup IP addresses
  URL:=https://www.usenix.org.uk/content/ripcalc.html
endef

define Package/ripcalc/description
  Calculate or lookup network addresses.
endef

define Package/ripcalc/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ripcalc $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ripcalc))
