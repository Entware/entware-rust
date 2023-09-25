# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=xplr
PKG_VERSION:=0.21.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sayanarijit/xplr/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=27800f0e731aedc194872609263e8c20b2e94b2f2e9088da5d3f501c406e938d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/xplr
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A hackable, minimal, fast TUI file explorer
  URL:=https://xplr.dev
  DEPENDS:=+luajit
endef

define Package/xplr/description
  A hackable, minimal, fast TUI file explorer.
endef

define Package/xplr/conffiles
/opt/etc/xplr/init.lua
endef

define Package/xplr/install
	$(INSTALL_DIR) $(1)/opt/etc/xplr
	echo "version = '$(PKG_VERSION)'" > $(1)/opt/etc/xplr/init.lua
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/xplr $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,xplr))
