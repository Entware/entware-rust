# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-net
PKG_VERSION:=1.10.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fennewald/nu_plugin_net
PKG_MIRROR_HASH:=87c68d12ba6aa6bf5aaeb52b5a54b5c86ac86b8597ea221a520839bf5feda06d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 iana-time-zone-0161 nushell

define Package/nu-plugin-net
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://fennewald.github.io/nu_plugin_net/
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
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
