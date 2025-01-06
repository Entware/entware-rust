# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-net
PKG_VERSION:=1.8.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fennewald/nu_plugin_net
PKG_MIRROR_HASH:=5e731ba0135daf2fde93cf8bf9b4c3dbc7c966617a59261024a60b4d8a3adb81

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/nu-plugin-net
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://github.com/fennewald/nu_plugin_net
  DEPENDS:=+nushell
  PROVIDES:=nu-plugin-pnet
endef

define Package/nu-plugin-net/description
  A nushell plugin for enumerating network interfaces in
  a platform-agnostic way.
endef

define Package/nu-plugin-net/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_net \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-net/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_net"
endef

$(eval $(call BuildPackage,nu-plugin-net))
