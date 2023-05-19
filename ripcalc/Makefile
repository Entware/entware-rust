# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=ripcalc
PKG_VERSION:=0.1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.com/edneville/$(PKG_NAME)/-/archive/v$(PKG_VERSION)
PKG_HASH:=371ba2569b57d2f786a29a5dd0e79d4366121ca229621f1574e5f46a039656b1

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" --strip-components=1 -xzf "$(DL_DIR)/$(PKG_SOURCE)"

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
