# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=sd
PKG_VERSION:=0.7.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/chmln/sd/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=faf33a97797b95097c08ebb7c2451ac9835907254d89863b10ab5e0813b5fe5f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

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
