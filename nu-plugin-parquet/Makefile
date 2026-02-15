# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-parquet
PKG_VERSION:=0.16.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_parquet
PKG_MIRROR_HASH:=61dc363207d04ba0d1681f5f4ca5b18f40a62e68f4a946e1291bcc9c7f611009

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 getrandom-033 iana-time-zone-0161 nushell

define Package/nu-plugin-parquet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to add parquet support
  URL:=https://github.com/jakeswenson/nu_plugin_parquet
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
  PROVIDES:=nu-plugin-from-parquet
endef

define Package/nu-plugin-parquet/description
  This is a nushell plugin to parse parquet data files into nu
  structured types.
endef

define Package/nu-plugin-parquet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_parquet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-parquet/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_parquet"
endef

$(eval $(call BuildPackage,nu-plugin-parquet))
