# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-bencode
PKG_REAL_VERSION:=0.11.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2025-05-19
PKG_SOURCE_VERSION:=ea5246d934a9be7fa670116a5f8edee77a80bb00
PKG_SOURCE_URL:=https://github.com/bluk/nu_plugin_from_bencode
PKG_MIRROR_HASH:=cb8139196f6d71f521666c201490d1d46d0cc5f56a2c7055d6dd28c2009b5d17

PKG_VERSION:=$(PKG_REAL_VERSION)_git$(subst -,,$(PKG_SOURCE_DATE))~$(call version_abbrev,$(PKG_SOURCE_VERSION))

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 iana-time-zone-0161 nushell

define Package/nu-plugin-from-bencode
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to convert bencode data
  URL:=https://github.com/bluk/nu_plugin_from_bencode
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
endef

define Package/nu-plugin-from-bencode/description
  A converter plugin from the bencode format for Nushell.
endef

define Package/nu-plugin-from-bencode/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_from_bencode \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-from-bencode/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_from_bencode"
endef

$(eval $(call BuildPackage,nu-plugin-from-bencode))
