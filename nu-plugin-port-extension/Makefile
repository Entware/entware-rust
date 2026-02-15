# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-port-extension
PKG_VERSION:=0.106.1
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/FMotalleb/nu_plugin_port_extension
PKG_MIRROR_HASH:=52dbc65cd9c323ed3e11e14501789744419d5d04ec18e45f479d2923f1871d01

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 iana-time-zone-0161 nushell

define Package/nu-plugin-port-extension
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A nushell plugin for scanning ports
  URL:=https://github.com/FMotalleb/nu_plugin_port_extension
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
  PROVIDES:=nu-plugin-port-scan
endef

define Package/nu-plugin-port-extension/description
  A nushell plugin to list all active connections and scanning ports
 on a target address.
endef

define Package/nu-plugin-port-extension/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_port_extension \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-port-extension/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_port_extension"
endef

$(eval $(call BuildPackage,nu-plugin-port-extension))
