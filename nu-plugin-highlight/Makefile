# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-highlight
PKG_VERSION:=1.4.8
PKG_RELEASE:=2

NUSHELL_VERSION:=0.106.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)+$(NUSHELL_VERSION)
PKG_SOURCE_URL:=https://github.com/cptpiepmatz/nu-plugin-highlight
PKG_MIRROR_HASH:=cf7f5426f08a1d46c1984f58ef5a700b36de3d288462eaf37ba103c7709e2d1f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 iana-time-zone-0161 nushell

define Package/nu-plugin-highlight
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin for syntax highlighting
  URL:=https://github.com/cptpiepmatz/nu-plugin-highlight
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
endef

define Package/nu-plugin-highlight/description
  nu-plugin-highlight is a plugin for Nushell that provides
  syntax highlighting for source code.
endef

define Package/nu-plugin-highlight/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_highlight \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-highlight/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_highlight"
endef

$(eval $(call BuildPackage,nu-plugin-highlight))
