# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-file
PKG_VERSION:=0.22.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_file
PKG_MIRROR_HASH:=1352e2fbe53f1da5066705747c81a3d0ddde7216576a7b3a8aac6a99229b2c6f

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0217 iana-time-zone-0164 nushell specta-105

define Package/nu-plugin-file
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=a nushell plugin called file
  URL:=https://github.com/fdncred/nu_plugin_file
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
endef

define Package/nu-plugin-file/description
  A nushell plugin that will inspect a file and return information
  based on it's magic number.
endef

define Package/nu-plugin-file/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_file \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-file/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_file"
endef

$(eval $(call BuildPackage,nu-plugin-file))
