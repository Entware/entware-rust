# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-regex
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-08
PKG_SOURCE_VERSION:=43f9596197606d8c031a5fa1c1b320ad4cc324c6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_regex
PKG_MIRROR_HASH:=4a4c3638cd9b09c35de6a9ebb435afb8a50746b13719c5dce3f8b76fa1a9bbf0

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/nu-plugin-regex
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to search text with regex
  URL:=https://github.com/fdncred/nu_plugin_regex
  DEPENDS:=+nushell
endef

define Package/nu-plugin-regex/description
  This is a nushell plugin to parse regular expressions.
endef

define Package/nu-plugin-regex/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_regex \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-regex/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_regex"
endef

$(eval $(call BuildPackage,nu-plugin-regex))
