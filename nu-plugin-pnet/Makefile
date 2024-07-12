# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-pnet
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-08
PKG_SOURCE_VERSION:=c5f5f716783d5759c718db8eb4df282805bab719
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_pnet
PKG_MIRROR_HASH:=a82f448cb82e2d28d0825ff6fbffaeec3585718ad95a694aaa7154548f80ba03

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/nu-plugin-pnet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://github.com/fdncred/nu_plugin_pnet
  DEPENDS:=+nushell
endef

define Package/nu-plugin-pnet/description
  A nushell plugin for enumerating network interfaces in
  a platform-agnostic way.
endef

define Package/nu-plugin-pnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_pnet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-pnet/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_pnet"
endef

$(eval $(call BuildPackage,nu-plugin-pnet))
