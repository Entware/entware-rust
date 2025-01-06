# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-from-bencode
PKG_VERSION:=0.11.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/bluk/nu_plugin_from_bencode
PKG_MIRROR_HASH:=e2feb9401302312da7c6b6e06d7c190131c60580ffd6dd8841abf2135e2d69a4

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/nu-plugin-from-bencode
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to convert bencode data
  URL:=https://github.com/bluk/nu_plugin_from_bencode
  DEPENDS:=+nushell
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
