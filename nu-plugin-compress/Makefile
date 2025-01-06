# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-compress
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/yybit/nu_plugin_compress
PKG_MIRROR_HASH:=25f857ab87524de6d941add48629114972b6c682b712ab63fdd200e0706dd36f

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/nu-plugin-compress
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin for compression and decompression
  URL:=https://github.com/yybit/nu_plugin_compress
  DEPENDS:=+liblzma +nushell
endef

define Package/nu-plugin-compress/description
  A nushell plugin for compression and decompression, supporting
  zstd, gzip, bzip2, and xz.
endef

define Package/nu-plugin-compress/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_compress \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-compress/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_compress"
endef

$(eval $(call BuildPackage,nu-plugin-compress))
