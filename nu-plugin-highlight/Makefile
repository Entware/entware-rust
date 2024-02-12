# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-highlight
PKG_VERSION:=1.0.7
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-11-05
PKG_SOURCE_VERSION:=74997784297325b5a896d1fa430a8c6b8d7d5f5f
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/cptpiepmatz/nu-plugin-highlight
PKG_MIRROR_HASH:=6b90e5ae6562ea4a28b9ade3ed6365fa9ac4a78356bc586fe73832c738b81f9a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/nu-plugin-highlight
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin for syntax highlighting
  URL:=https://github.com/cptpiepmatz/nu-plugin-highlight
  DEPENDS:=+nushell
endef

define Package/nu-plugin-highlight/description
  nu-plugin-highlight is a plugin for Nushell that provides
  syntax highlighting for source code.
endef

define Package/nu-plugin-highlight/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_highlight \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-highlight/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_highlight"
endef

$(eval $(call BuildPackage,nu-plugin-highlight))
