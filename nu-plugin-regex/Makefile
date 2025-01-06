# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-regex
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_regex
PKG_MIRROR_HASH:=9cdf53dd4735613688eff7a9640b337ae9213cadaddb646e7f7a842e083a8c5b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

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

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_regex"
endef

$(eval $(call BuildPackage,nu-plugin-regex))
