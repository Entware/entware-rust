# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=xplr
PKG_VERSION:=0.21.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sayanarijit/xplr/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=c6e2b800888363c6d6101eafe585723a5bf9cc304cedff77a302c0e2a6d0a151

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/xplr
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A hackable, minimal, fast TUI file explorer
  URL:=https://xplr.dev
  DEPENDS:=@HAS_LUAJIT_ARCH +luajit
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
