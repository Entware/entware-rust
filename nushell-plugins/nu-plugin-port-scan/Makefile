# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-port-scan
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-11-15
PKG_SOURCE_VERSION:=69f264492948ac7e6054bf974a94a157696dde78
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/FMotalleb/nu_plugin_port_scan
PKG_MIRROR_HASH:=cb91b1c60753a8817ae0fa15027b160966fbb50aaefcaaa086115dd6a5156e3a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

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
