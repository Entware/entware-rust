# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=xplr
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sayanarijit/xplr/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=6f63a3394ad330cc80648448924d8c6dd848514707228d869ff27e35562804ff

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-034 getrandom-043

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
	$(CP) $(PKG_BUILD_DIR)/src/init.lua $(1)/opt/etc/xplr
	$(SED) "s,.*version =.*,version = '$(PKG_VERSION)'," $(1)/opt/etc/xplr/init.lua
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/xplr $(1)/opt/usr/bin
endef

define Package/xplr/postinst
#!/bin/sh

[ -f "/opt/etc/xplr/init.lua" ] && \
 sed -i -e "s,version = .*,version = '$(PKG_VERSION)'," /opt/etc/xplr/init.lua
endef

$(eval $(call BuildPackage,xplr))
