# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-explore
PKG_VERSION:=0.92.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-12
PKG_SOURCE_VERSION:=7f7401791f47e99665027e4857556833b25a3fc3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/amtoine/nu_plugin_explore
PKG_MIRROR_HASH:=987b041218a0c1a7c041f4531403f82dac9253fa8d48b529febccdb9f2873246

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/nu-plugin-explore
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A fast structured data explorer for Nushell
  URL:=https://github.com/amtoine/nu_plugin_explore
  DEPENDS:=+nushell
endef

define Package/nu-plugin-explore/description
  A fast interactive explorer tool for structured data inspired by
  nu-explore.
endef

define Package/nu-plugin-explore/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_explore \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-explore/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_explore"
endef

$(eval $(call BuildPackage,nu-plugin-explore))
