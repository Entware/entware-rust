# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-regex
PKG_VERSION:=0.24.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_regex
PKG_MIRROR_HASH:=f443f5afaacbd3428dc4946e43e5c02d0ad5d1f2995f99422c8ff93e63e4e7ce

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 iana-time-zone-0164 nushell

define Package/nu-plugin-regex
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to search text with regex
  URL:=https://github.com/fdncred/nu_plugin_regex
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
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
