# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-compress
PKG_VERSION:=0.2.8
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=5fca7157dd5d1061df752e786fc7068e4e914b9d
PKG_SOURCE_URL:=https://github.com/yybit/nu_plugin_compress
PKG_MIRROR_HASH:=4628762e83d22b1781def7a960ff797b091500c1ffd5d250e435f7f940e5eeb7

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 getrandom-033 iana-time-zone-0161 nushell

define Package/nu-plugin-compress
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin for compression and decompression
  URL:=https://github.com/yybit/nu_plugin_compress
  DEPENDS:=+liblzma
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
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
