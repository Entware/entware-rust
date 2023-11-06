# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-regex
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-27
PKG_SOURCE_VERSION:=b0063e2537ff549d5388113df75aa82fbce441b4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_regex
PKG_MIRROR_HASH:=966999ed6a28aab387203fe92aa895ef762b545a6ad4390c105cd9d77d8d12d8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

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
