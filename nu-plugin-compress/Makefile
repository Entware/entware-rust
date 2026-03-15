# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-compress
PKG_VERSION:=0.2.10
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=8faa05e7705f19fa71f70cb46319952084545d1b
PKG_SOURCE_URL:=https://github.com/yybit/nu_plugin_compress
PKG_MIRROR_HASH:=bcfd99f75218094579af22ec4bdb96518fdd829b614ec8a4a3c812f10ab6b01a

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 getrandom-034 iana-time-zone-0164 nushell

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
