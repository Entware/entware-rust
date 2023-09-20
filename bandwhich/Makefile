# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bandwhich
PKG_VERSION:=0.21.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/imsnif/bandwhich/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f9c50c340372593bf4c54fcf2608ef37c2c56a37367b2f430c27cce3ea947828

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

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
