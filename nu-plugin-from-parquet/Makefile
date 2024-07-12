# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-parquet
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-08
PKG_SOURCE_VERSION:=1b701c5fd8295412f45ddb941b2b59c8e66cf26a
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_from_parquet
PKG_MIRROR_HASH:=55460436345ee120f78e9351c2e10253474a4f410774cfac343bb06e63360602

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/nu-plugin-from-parquet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to add parquet support
  URL:=https://github.com/jakeswenson/nu_plugin_from_parquet
  DEPENDS:=+nushell
endef

define Package/nu-plugin-from-parquet/description
  This is a nushell plugin to parse parquet data files into nu
  structured types.
endef

define Package/nu-plugin-from-parquet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_from_parquet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-from-parquet/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_from_parquet"
endef

$(eval $(call BuildPackage,nu-plugin-from-parquet))
