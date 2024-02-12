# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-port-scan
PKG_VERSION:=1.0.9
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-01-10
PKG_SOURCE_VERSION:=5e7e5b84e1be027643cfca50d5d6a60601156508
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/FMotalleb/nu_plugin_port_scan
PKG_MIRROR_HASH:=75c6edca3bc8782ab7fe330bd0d49a8f28f10aef8c9a94a206e98e528fb467f4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/nu-plugin-port-scan
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A nushell plugin for scanning ports on a target
  URL:=https://github.com/FMotalleb/nu_plugin_port_scan
  DEPENDS:=+nushell
endef

define Package/nu-plugin-port-scan/description
  A nushell plugin for scanning ports on a target.
endef

define Package/nu-plugin-port-scan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_port_scan \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-port-scan/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_port_scan"
endef

$(eval $(call BuildPackage,nu-plugin-port-scan))
