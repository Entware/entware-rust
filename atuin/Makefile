# SPDX-License-Identifier: WTFPL

# XXX depends on "ring"

include $(TOPDIR)/rules.mk

PKG_NAME:=atuin
PKG_VERSION:=14.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ellie/atuin/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=00ba6eea19f11b3f73652e71af69b3dc7eb221761519f3b9680047f5476915b4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/atuin
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=magical shell history
  URL:=https://atuin.sh
  DEPENDS:=@!(mips||mipsel)
endef

define Package/atuin/description
  Magical shell history.
endef

define Package/atuin/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/atuin $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,atuin))
