# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-regex
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-04-10
PKG_SOURCE_VERSION:=06b9aada8df0272bb7500e13f0f611f345c0e0b3
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_regex
PKG_MIRROR_HASH:=559eb94d9864d4e63b2f78ebfacb221c5656644b5c7691adc1a354aa130f9d57

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

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_regex'\n"
endef

$(eval $(call BuildPackage,nu-plugin-regex))
