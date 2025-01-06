# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-port-scan
PKG_VERSION:=1.2.7
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-12-23
PKG_SOURCE_VERSION:=c3307b4bc135621a14a140ed2a8c2b51fd7c070c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/FMotalleb/nu_plugin_port_scan
PKG_MIRROR_HASH:=ef2c2caa4acacb6c9aa938a1ef2483bd3f9b4206dfcadfa6424da4681709408a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 iana-time-zone-0161

define Package/nu-plugin-port-scan
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A nushell plugin for scanning ports on a target
  URL:=https://github.com/FMotalleb/nu_plugin_port_scan
  DEPENDS:=+nushell
endef

define Package/nu-plugin-port-scan/description
  A nushell plugin for scanning ports on a target.
endef

define Package/nu-plugin-port-scan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_port_scan \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-port-scan/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_port_scan"
endef

$(eval $(call BuildPackage,nu-plugin-port-scan))
